class BoardsController < ApplicationController
  before_action :set_board_and_link, except: ['create', 'external']

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
    @sharelink = "#{request.protocol + request.host_with_port}/boards/view/#{@board.verificator}"
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
      if @board.user == current_user && @board.save
        format.json {render json: @board}
      else
        format.json {render json: @board.errors, status: :unprocessable_entity}
      end
    end
  end

  def external
    @board = Board.find_by_verificator(params[:verificator])
    return redirect_to(root_path, :notice => "This is a private board and you cannot access it #{@board.user.name}") if @board.private && @board.user != current_user
    if @board.user == current_user
      redirect_to board_path(@board)
    else
      render 'show'
    end
  end

  private

  def set_board_and_link
    @board = Board.find_by_id(params[:id])
    @board = current_user.boards.find_by_id(params[:id]) if @board && @board.private
    return redirect_to(dashboard_path, :notice => 'The board you are looking for was not found') unless @board
  end

  def board_params
    params.require(:board).permit(:title, :private, :user_id)
  end 

end
