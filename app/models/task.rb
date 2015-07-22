class Task < ActiveRecord::Base
  belongs_to :board
  acts_as_list scope: :board

  validates_presence_of :title, :status, :board

  scope :by_status, -> (status) {where(status: status).select(:id, :status, :title, :position).order(position: :asc)}
  ### Statuses are:
  ### 0 - To-do, 1 - In progress, 2 - In verification, 3- Done

  def set_position(index)
    first_item_position = board.tasks.by_status(self.status)[index].position
    insert_at(first_item_position)
  end

end
