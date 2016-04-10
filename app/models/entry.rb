class Entry < ActiveRecord::Base
  USER_REQUEST = "https://api.github.com/users/#{ENV['GITHUB_USERNAME']}".freeze
  RAW_REQUEST = "https://raw.githubusercontent.com/#{ENV['GITHUB_USERNAME']}"
                .freeze

  # TODO: instead of destroy_all, figure out which entries were unstarred and
  # remove them. Or do some sort of pretty URL.
  # TODO: only add starred repos that the user owns
  def self.load_starred
    Entry.destroy_all
    response = RestClient.get "#{USER_REQUEST}/starred"
    upsert_entries(response)
  end

  def self.upsert_entries(response)
    parsed_response = JSON.parse(response)
    parsed_response.each do |entry|
      upsert(entry)
    end
  end

  def self.upsert(entry_hash)
    entry_json = JSON.generate(entry_hash)
    entry = find_or_initialize_by(name: entry_hash['name'])
    content = entry.generate_content
    if entry.id
      entry.update(github_response: entry_json, content: content)
    else
      entry.github_response = entry_json
      entry.content = content
      entry.save
    end
  end

  def generate_content
    entry_request = "#{RAW_REQUEST}/#{name}/natsyrk/portfolio_entry.md"
    RestClient.get(entry_request) do |response|
      return generate_backup_content unless response.code == 200
      response
    end
  end

  def generate_backup_content
    readme_request = "#{RAW_REQUEST}/#{name}/master/README.md"
    RestClient.get(readme_request) do |response|
      return nil unless response.code == 200
      response
    end
  end
end
