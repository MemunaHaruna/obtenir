module ExitComand
  def self.exit
    puts "Enter 0 to exit this program"
    return if gets.strip.to_i == 0
  end
end
