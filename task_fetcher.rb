require 'nokogiri'
require 'open-uri'

class TaskFetcher

  def initialize
    @url   = "https://www.ignacio.al/tasks"
    @tasks = []
  end


  def fetch
    doc        = URI.open("https://www.ignacio.al/tasks").read
    parsed_doc = Nokogiri::HTML(doc)

    parsed_doc.search('li').each do |html_task|
      title     = html_task.search('.task-title').text
      completed = html_task.search('.task-completed').text == "yes"

      task = Task.new(title, completed)

      @tasks << task
    end

    @tasks
  end
end