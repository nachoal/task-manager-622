require_relative 'task'
require_relative 'task_repository'
require_relative 'tasks_controller'
require_relative 'router'
# task   = Task.new('get the milk')
# task_2 = Task.new('Watch the lecture', true)

task_repository  = TaskRepository.new
tasks_controller = TasksController.new(task_repository)
router           = Router.new(tasks_controller)

router.run

# tasks_controller.add
# tasks_controller.add

# tasks_controller.display

# tasks_controller.mark_as_completed
# tasks_controller.display

# tasks_controller.delete
# tasks_controller.display

# puts "Testing #add:"
# task_repository.add(task)
# task_repository.add(task_2)

# puts "Testing #all"
# p task_repository.all

# puts "Testing #find"
# p task_repository.find(0) # => task instance (get the milk)

# puts "Testing #delete"
# task_repository.delete(1)
# p task_repository.all


doc        = URI.open("https://www.ignacio.al/tasks").read
parsed_doc = Nokogiri::HTML(doc)

parsed_doc.search('li').each do |html_task|
  title     = html_task.search('.task-title').text
  completed = html_task.search('.task-completed').text == "yes"

  task = Task.new(title, completed)
end