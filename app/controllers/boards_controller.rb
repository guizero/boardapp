class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, except: ['create']

  def create
    @board = Board.new(board_params)
    @board.user = current_user

    respond_to do |format|      
      if @board.save
        format.html { redirect_to(board_path(@board)) }
      else
        format.html { redirect_to dashboard_path }
      end
    end
  end

  def show
  end

  def destroy
    respond_to do |format|      
      if @board.destroy
        format.html { redirect_to(dashboard_path, flash: { :success => 'Board successfully deleted' } ) }
      else
        format.html { render action: "show" }
      end
    end
  end

  def retrieve_tasks
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :private, :user_id)
  end 

end
