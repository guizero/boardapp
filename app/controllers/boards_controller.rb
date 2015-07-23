class BoardsController < ApplicationController
  before_action :set_board_and_link, except: ['create']

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

  def update
    @board.assign_attributes(board_params)
    respond_to do |format|   
      if @board.save
        format.json {render json: @board}
      else
        format.json {render json: @board.errors, status: :unprocessable_entity}
      end
    end
  end

  def external
    render 'boards/show'
  end

  private

  def set_board_and_link
    @board = Board.find_by_id(params[:id])
    @board = Board.find_by_verificator(params[:verificator]) if params[:verificator]
    return redirect_to(dashboard_path, :notice => 'The board you are looking for was not found') unless @board
    if @board || @board.private
      if current_user
        @board = current_user.boards.find_by_id(params[:id]) if @board.private
      else
        redirect_to(root_path, :notice => 'This is a private board and you cannot access it')
      end
    end
    @sharelink = "#{request.protocol + request.host_with_port}/boards/view/#{@board.verificator}" if current_user
  end

  def board_params
    params.require(:board).permit(:title, :private, :user_id)
  end 

end
