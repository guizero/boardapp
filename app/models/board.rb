class Board < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates_presence_of :title

  def tasks_by_status
    tasks = {}
    [0,1,2,3].each do |status|
      tasks[status] = {}
      tasks[status]['name'] = ['To-do', 'In progress', 'In verification', 'Done'][status]
      tasks[status]['class'] = %w(red light-blue yellow green)[status]
      tasks[status]['items'] = self.tasks.by_status(status)
    end
    return tasks
  end

end
