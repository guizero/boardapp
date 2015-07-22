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

  def update
    @task = Task.find(params[:id])
    @task.status = params[:status]
    respond_to do |format|   
      if @task.save
        @task.set_position(params[:index])
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
