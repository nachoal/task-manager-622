require_relative 'tasks_view'

class TasksController
  def initialize(task_repository)
    @task_repository = task_repository
    @tasks_view      = TasksView.new
  end

  # 1. Display all Tasks
  def display
    tasks = @task_repository.all

    # Display the list tasks to the user
    @tasks_view.display(tasks)
  end

  # 2. Add a new Task
  def add
    # 1. Ask the user for the task title gets chomp
    title = @tasks_view.ask_for("task title")
    # 2. Create a new task with the title (Task.new(title))
    task = Task.new(title)
    # 3. Store in the repository repo.add(task)
    @task_repository.add(task)
  end

  # 3. Mark a Task as completed
  def mark_as_completed
    # 1. Ask user for the number of the task to delete
    task_index = @tasks_view.ask_for("task number from the list").to_i - 1
    # 2. tasks_repository.find(index)
    # 3. task.complete!
    task = @task_repository.mark_as_completed(task_index)
  end

  # 4. Delete a Task
  def delete
    # 1. Ask user for task to delete
    task_index = @tasks_view.ask_for("task number from the list").to_i - 1
    # 2. find index
    # 3. Delete
    @task_repository.delete(task_index)
  end
end