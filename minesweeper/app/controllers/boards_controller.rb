class BoardsController < ApplicationController
  before_action :set_board, only: %i[show]

  def index
    @boards = Board.search(params[:query])
    @boards = sort_boards(@boards)

    @boards = @boards.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      # BoardMailer.board_generated_email(@board).deliver_now
      redirect_to board_url @board, notice: 'Successfully created.'
    else
      flash[:alert] = 'Invalid data'
    end
  end

  private

  def sort_boards(boards)
    case params[:sort]
    when "by_size"
      boards.order_by_size
    when "by_name"
      boards.order_by_name
    when "by_difficulty"
      boards.order_by_difficulty
    else
      boards
    end
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(
      :name,
      :email,
      :height,
      :width,
      :mines_number,
      :query
    )
  end
end
