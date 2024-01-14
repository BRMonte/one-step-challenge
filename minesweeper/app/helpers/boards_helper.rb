module BoardsHelper

  def get_board_technical_representation(board)
    BoardGeneratorService.new(board).call
  end

  def get_cell_value(value)
    value.nil? ? ' ' : 'X'
  end
end
