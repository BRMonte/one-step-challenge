class BoardMailer < ApplicationMailer
  def board_generated_email(board)
    @board = board
    mail(to: @board.email, subject: 'You just created a new minesweeper board')
  end
end
