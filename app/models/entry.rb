class Entry < ActiveRecord::Base
  def self.load_starred
    begin
      response = RestClient.get 'https://api.github.com/users/gitKrystan/starred'
    rescue => e
      puts e.response
    end
    find_or_create_entries(response)
  end

  def self.find_or_create_entries(response)
    parsed_response = JSON.parse(response)
    parsed_response.each do |repo|
      repo_json = JSON.generate(repo)
      Entry.create(github_response: repo_json)
    end
  end
end
