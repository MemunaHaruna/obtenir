require 'mongo'
require 'colorize'

module Database
  class DB
    def initialize(response)
      @response = response
    end

    def save
      puts "Before you proceed, start a mongodb instance by running *mongod* or *sudo mongod* in another terminal".colorize(:red)
      puts "please enter mongodb database name: ".colorize(:yellow)
      database = gets.strip.downcase
      client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => database)
      collection = client[:people]
      result = collection.insert_one(@response)
      puts "Response saved in database: #{database.capitalize} successfully.".colorize(:green)
    rescue StandardError => e
      puts "Error: #{e.message} occurred when saving response".colorize(:red)
    end
  end
end
