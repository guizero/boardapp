class Board < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates_presence_of :title

  def tasks_by_status
    tasks = {}
    [0..3].each do |status|
      tasks[status].name = ['To-do', 'In progress', 'In verification', 'Done'][status]
      tasks[status].class = %w(red light-blue yellow green)[status]
      tasks[status].items << tasks.by_status(status)
    end
    return tasks
  end

end
