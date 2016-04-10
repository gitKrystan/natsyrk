class Entry < ActiveRecord::Base
  USER_REQUEST = "https://api.github.com/users/#{ENV['GITHUB_USERNAME']}".freeze

  def self.load_starred
    begin
      response = RestClient.get "#{USER_REQUEST}/starred"
    rescue => e
      puts e.response
    end
    upsert_entries(response)
  end

  def self.upsert_entries(response)
    parsed_response = JSON.parse(response)
    parsed_response.each do |entry|
      upsert_entry(entry)
    end
  end

  def self.upsert_entry(entry_hash)
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
