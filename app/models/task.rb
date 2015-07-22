class Task < ActiveRecord::Base
  belongs_to :board

  validates_presence_of :title, :status, :board

  scope :by_status, -> (status) {where(status: status)}
  ### Statuses are:
  ### 0 - To-do, 1 - In progress, 2 - In verification, 3- Done

end
