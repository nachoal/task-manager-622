# MODEL
class Task
  attr_reader :name

  def initialize(name, completed = false, description)
    @name        = name
    @completed   = completed
    @description = description
  end

  def completed?
    @completed
  end

  def complete!
    @completed = true
  end
end