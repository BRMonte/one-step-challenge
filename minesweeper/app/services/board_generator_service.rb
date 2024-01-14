class BoardGeneratorService
  MINE = 'x'
  EMPTY = nil

  def initialize(board)
    @height = board.height
    @width = board.width
    @mines_number = board.mines_number
  end

  def call
    board = initialize_board
    place_mines(board)
    board
  end

  private

  def initialize_board
    Array.new(@height) { Array.new(@width, EMPTY) }
  end

  def place_mines(board)
    @mines_number.times do
      row = rand(@height)
      col = rand(@width)

      redo if board[row][col] == MINE

      board[row][col] = MINE
    end
  end
end
