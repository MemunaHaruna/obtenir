require 'httparty'

module Obtenir
  class APIRequest
    def self.fetch(username)
      HTTParty.get("https://api.github.com/users/#{username}")
    rescue StandardError => error
      puts "Error: [#{error.message}] occurred while fetching data...".colorize(:red)
      Exit.exit
    end
  end
end

