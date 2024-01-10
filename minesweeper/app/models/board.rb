class Board < ApplicationRecord
  validates :name, :email, :height, :width, :mines_number, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 50 }
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
end
