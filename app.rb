require_relative 'task'
require_relative 'task_repository'
require_relative 'tasks_controller'
require_relative 'router'

task_repository  = TaskRepository.new("tasks.csv")
tasks_controller = TasksController.new(task_repository)
router           = Router.new(tasks_controller)
router.run