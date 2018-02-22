require 'httparty'

module APIRequest
  class GithubAPIRequest
    def self.fetch(username)
      HTTParty.get("https://api.github.com/users/#{username}")
    end
  end
end

