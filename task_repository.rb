require "csv"
require_relative "task"

class TaskRepository
  def initialize(csv_file_path)
    @tasks         = []
    @csv_file_path = csv_file_path

    load_csv
  end

  # CRUD
  # Read all the tasks
  def all
    @tasks
  end

  # Get one task by index
  def find(index)
    @tasks[index]
  end

  # Delete a task from the array
  def delete(index)
    @tasks.delete_at(index)

    save_csv
  end

  # add a task
  def add(task)
    @tasks << task

    save_csv
  end

  def mark_as_completed(index)
    task = @tasks[index]
    task.complete!
    save_csv
  end

  private

  def load_csv
    csv_options = { col_sep: ",", quote_char: '"', headers: :first_row }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      # name: String
      name      = row["name"]
      completed = row["completed"] == "true"

      task = Task.new(name, completed)

      @tasks << task
    end
  end

  def save_csv
    csv_options = { col_sep: ",", force_quotes: true, quote_char: '"' }

    CSV.open(@csv_file_path, "wb", csv_options) do |csv|
      csv << ["name", "completed"]

      @tasks.each do |task|
        csv << [task.name, task.completed?]
      end
    end
  end
end
