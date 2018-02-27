module Obtenir
  class Exit
    def self.exit(message = "Goodbye")
      abort(message.colorize(:yellow))
    end
  end
end

