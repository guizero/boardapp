class Task < ActiveRecord::Base
  belongs_to :board

  validates_presence_of :title, :status, :board

  ### There is only one list to order tasks, scoped by the boards they belong to
  ### Even if statuses are different. See set_position to understand the work.
  acts_as_list scope: :board  

  ### Statuses are:
  ### 0 - To-do, 1 - In progress, 2 - In verification, 3- Done
  scope :by_status, -> (status) {where(status: status).select(:id, :status, :title, :position).order(position: :asc)}

  ### The position of the task in the board list determines its priority
  ### This method sets the position of the task in the list (acts_as_list gem)
  ### According to the index passed by the ajax call.
  def set_position(index)
    first_item_position = board.tasks.by_status(self.status)[index].position
    insert_at(first_item_position)
  end

end
