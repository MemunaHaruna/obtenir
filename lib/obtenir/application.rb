module Obtenir
  class Application
    def get_username
      print "Please enter a valid github username: ".colorize(:yellow)
      @username = gets.strip
      get_user_details
    end

    def get_user_details
      @response = APIRequest.fetch(@username)
      get_username if @response.message == 'Not Found'
      process_response
    end

    def process_response
      puts "Would you like to save the response?(y/n): ".colorize(:yellow)
      reply = gets.downcase.strip
      return if reply == 'n'
      puts "Where would you like to save this response?".colorize(:yellow)
      puts "Enter [1] for File, [2] for Database and any other character to exit".colorize(:yellow)
      decision = gets.strip.to_i
      save_github_user(decision)
    end

    def save_github_user(decision)
      case decision
        when 1 then save_to_file
        when 2 then save_to_database
        else
          puts "Goodbye!".colorize(:red)
      end
    end

    def save_to_file
      puts "Please provide the absolute path to the file where the response will be saved".colorize(:yellow)
      file_path = gets.strip
      if FileOperations.new(file_path, @response).save?
        puts "Response saved successfully. You can view it here: #{file_path}".colorize(:green)
      else
        puts "Directory does not exist".colorize(:red)
      end
    end

    def save_to_database
      puts "Before you proceed, start a mongodb instance by running *mongod* or *sudo mongod* in another terminal".colorize(:red)
      puts "please enter mongodb database name: ".colorize(:yellow)
      database = gets.strip.downcase
      if Database.new(database, @response).save?
        puts "Response saved in database: #{database.capitalize} successfully.".colorize(:green)
      end
    end
  end

end
