class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission

  def create
    respond_to do |format|    
      if @task.board.user == current_user && @task.save
        format.json {render json: @task}
      else
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
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

  def destroy
    respond_to do |format|   
      if @task.destroy
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

  def require_permission
    @task = Task.find_by_id(params[:id]) ? Task.find_by_id(params[:id]) : Task.new(task_params)
    render json: 'User cannot access this task' unless @task.board.user == current_user
  end
end
