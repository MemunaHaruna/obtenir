require 'colorize'

module Obtenir
  class FileOperations
    def initialize(file_path, data)
      @file_path = file_path
      @data = data
    end

    def save?
      f = File.new(@file_path, "w")
      f.write(@data)
      f.close
      true
    rescue
      false
    end
  end
end
