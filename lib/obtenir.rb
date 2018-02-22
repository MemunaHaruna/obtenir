# require "obtenir/version"
require 'httparty'
require 'mongo'

module Obtenir
  class APIQuery
    def get_username
      print "Please enter a github username: "
      username = gets.strip

      @response = HTTParty.get("https://api.github.com/users/#{username}")
      query(@response)
    end

    def query(response)
      if response.message == 'Not Found'
        puts "invalid username"
        return get_username
      end
      print "Would you like to save the response?(y/n): "
      reply = gets.downcase.strip
      if reply == 'n'
        return
      end
      process
    end

    def process
      puts "Where would you like to save this response?"
      puts "1. A File"
      puts "2. A Database"
      result = gets.strip.to_i
      case result
        when 1 then FileDocument.new(@response).save
        when 2 then DB.new(@response).save
        else
          return "Invalid input"
      end
    end
  end

  class FileDocument
    def initialize(response)
      @response = response
    end

    def save
      f = File.new(File.join(Dir.pwd,'lib/obtenir/assets','user_details.rb'), "w")
      f.write(@response)
      f.close
    end
  end

  class DB
    def initialize(response)
      @response = response
    end

    def save
      puts "Start a mongodb instance by running *mongod* or *sudo mongod*"
      puts "please enter database name: "
      database = gets.strip.downcase
      client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => database)
      collection = client[:people]
      result = collection.insert_one(@response)
      puts result.n
    end
  end
end


Obtenir::APIQuery.new.get_username

