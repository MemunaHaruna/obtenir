require 'colorize'

module FileOperations
  class Document
    def initialize(response)
      @response = response
    end

    def save
      # File.join(Dir.pwd,'lib/obtenir/assets','user_details.rb')
      # "/Users/memuna/Desktop/ruby_code_personal/obtenir/obtenir/lib/obtenir/assets/bleh.txt"
      # puts "Please provide the absolute path to the file where the response will be saved".colorize(:yellow)

      file_path = File.join(Dir.pwd,'lib/obtenir/assets','bleh.txt')
      f = File.new(file_path, "w")
      f.write(@response)
      f.close
      puts "Response saved successfully. You can view it here: #{file_path}".colorize(:green)
    rescue
      puts "Directory does not exist".colorize(:red)
    end
  end
end
