module BoardsHelper

  def get_board_technical_representation(board)
    BoardGeneratorService.new(board).call
  end
end
