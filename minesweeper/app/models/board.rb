class Board < ApplicationRecord
  validates :name, :email, :height, :width, :mines_number, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 30 }
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :height, :width, numericality: { greater_than_or_equal_to: 2 }
  validates :mines_number, numericality: { greater_than_or_equal_to: 0 }
  validate :less_mines_than_board_area?

  private

  def less_mines_than_board_area?
    return if mines_number <= height * width

    errors.add(:mines_number, 'must be less than the area of the board')
  end
end
