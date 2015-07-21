class BoardsController < ApplicationController
  before_action :authenticate_user!

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
    @board = Board.find(params[:id])
  end

  private

  def board_params
    params.require(:board).permit(:title, :private, :user_id)
  end 

end
