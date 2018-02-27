module Obtenir
  class Application
    def get_input(message)
      puts message.colorize(:yellow)
      input = gets.downcase.strip
      Exit.exit if input == ('0' || 'n')
      input
    end

    def fetch_user(username)
      puts "Fetching #{username}'s details from github..."
      APIRequest.fetch(username)
    end

    def process
      message = "Not Found"
      while message == "Not Found" do
        @response = fetch_user(get_input("Please enter a valid github username or 0 to exit:"))
        message = @response.message
      end
      get_input("Would you like to save the response?(y/n):")
      decision = get_input("Where would you like to save this response?
      Enter [1] for File, [2] for Database and [0] to exit")
      save(decision)
    end

    def save(decision)
      case decision
        when "1" then save_to_file
        when "2" then save_to_database
        else
          Exit.exit("Oops... invalid entry. Please, try again")
      end
    end

    def save_to_file
      file_path = get_input("Enter the absolute path to the file: ")
      FileOperations.new(file_path, @response).save
    end

    def save_to_database
      puts "Before you proceed, start a mongodb instance by running *mongod* or *sudo mongod* in another terminal".colorize(:red)
      database = get_input("Kindly enter a Mongodb database name:")
      Database.new(database, @response).save
    end
  end

end
