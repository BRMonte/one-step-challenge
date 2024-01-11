class PagesController < ApplicationController
  def home
    @board = Board.new
    @boards = Board.recently_created
  end
end
