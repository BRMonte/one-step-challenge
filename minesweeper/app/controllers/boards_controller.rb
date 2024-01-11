class BoardsController < ApplicationController
  before_action :set_board, only: %i[show]

  def index
    # @boards = Board.all
    @boards = Board.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to board_url @board, notice: 'Successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :email, :height, :width, :mines_number)
  end
end
