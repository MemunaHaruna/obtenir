require_relative "./obtenir/version"
require 'colorize'
require_relative './obtenir/services/api_request'
require_relative './obtenir/services/database'
require_relative './obtenir/services/file_operations'

module Obtenir
  class Obtenir
    def get_github_user
      print "Please enter a valid github username: ".colorize(:yellow)
      username = gets.strip
      response = APIRequest::GithubAPIRequest.fetch(username)
      return "Invalid username".colorize(:red) if response.message == 'Not Found'
      process(response)
    end

    def process(response)
      puts "Would you like to save the response?(y/n): ".colorize(:yellow)
      reply = gets.downcase.strip
      return if reply == 'n'
      puts "Where would you like to save this response?".colorize(:yellow)
      puts "1. A File or 2. A Database".colorize(:yellow)
      save_github_user(gets.strip.to_i, response)
    end

    def save_github_user(decision, response)
      case decision
        when 1 then FileOperations::Document.new(response).save
        when 2 then Database::DB.new(response).save
        else
          puts "Invalid input".colorize(:red)
      end
    end
  end

end


Obtenir::Obtenir.new.get_github_user

