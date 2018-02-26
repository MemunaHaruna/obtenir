require 'httparty'

module Obtenir
  class APIRequest
    def self.fetch(username)
      HTTParty.get("https://api.github.com/users/#{username}")
    end
  end
end

