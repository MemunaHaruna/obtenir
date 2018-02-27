require 'colorize'

module Obtenir
  class FileOperations
    def initialize(file_path, data)
      @file_path = file_path
      @data = data
    end

    def save
      f = File.new(@file_path, "w")
      f.write(@data)
      f.close
      puts "Response saved successfully. You can view it here: #{@file_path}".colorize(:green)
    rescue StandardError => error
      puts error.message.colorize(:red)
      Exit.exit
    end
  end
end
