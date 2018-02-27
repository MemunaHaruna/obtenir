require 'mongo'
require 'colorize'

module Obtenir
  class Database
    def initialize(database, data)
      @database = database
      @data = data
    end

    def save
      client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => @database)
      collection = client[:people]
      result = collection.insert_one(@data)
      puts "Response saved in database: #{@database.capitalize} successfully.".colorize(:green)
    rescue StandardError => error
      puts "Error: #{error.message} occurred when saving data".colorize(:red)
    end
  end
end
