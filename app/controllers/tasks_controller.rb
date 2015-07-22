class TasksController < ApplicationController
  before_action :authenticate_user!
  def create
    @task = Task.new(task_params)

    respond_to do |format|   
      if @task.save
        format.json {render json: @task}
      else
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :status, :board_id)
  end 
end
