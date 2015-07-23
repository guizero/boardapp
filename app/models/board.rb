class Board < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, -> {order(position: :asc)}, dependent: :destroy

  validates_presence_of :title

  before_create :save_verificator

  def tasks_by_status
    tasks = {}
    [0,1,2,3].each do |status|
      tasks[status] = {}
      tasks[status]['name'] = ['To-do', 'In progress', 'To verify', 'Done'][status]
      tasks[status]['class'] = %w(red light-blue yellow green)[status]
      tasks[status]['items'] = self.tasks.by_status(status)
    end
    return tasks
  end

  private

  def save_verificator
    self.verificator = Digest::MD5.hexdigest(Figaro.env.boardapp_secret.to_s + self.id.to_s)
  end

end
