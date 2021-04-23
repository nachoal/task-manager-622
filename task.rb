# MODEL
class Task
  attr_reader :name

  def initialize(name, completed = false)
    @name      = name
    @completed = completed
  end

  def completed?
    @completed
  end

  def complete!
    @completed = true
  end
end