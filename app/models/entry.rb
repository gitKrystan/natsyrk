class Entry < ActiveRecord::Base
  USER_REQUEST = "https://api.github.com/users/#{ENV['GITHUB_USERNAME']}".freeze

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
    if entry.id
      entry.update(github_response: entry_json)
    else
      entry.github_response = entry_json
      entry.save
    end
  end
end
