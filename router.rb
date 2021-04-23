class Router
  def initialize(tasks_controller)
    @tasks_controller = tasks_controller
    @running          = true
  end

  def run
    puts "--------------- WELCOME TO YOUR TODO LIST MANAGER ---------------"
    puts "-----------------------------------------------------------------"

    while @running
      puts "1. Display all Tasks"
      puts "2. Add a new Task"
      puts "3. Mark a Task as completed"
      puts "4. Delete a Task"
      puts "5. Exit"
      puts "Please pick an option:"
      print "> "

      user_choice = gets.chomp

      case user_choice
      when "1"
        @tasks_controller.display
      when "2"
        @tasks_controller.add
      when "3"
        @tasks_controller.mark_as_completed
      when "4"
        @tasks_controller.delete
      when "5"
        @running = false
        puts "The struggle ends when the gratitude begins. -Neale Donald Walsch"
      else
        puts "Please input a valid number (1-5)"
      end
    end
  end
end