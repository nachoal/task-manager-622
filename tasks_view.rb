class TasksView

  def display(tasks)
    tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task.name} #{task.completed? ? "[X]" : "[ ]"}"
    end
  end

  def ask_for(text)
    puts "Whats the #{text}?"
    print "> "

    gets.chomp
  end
end