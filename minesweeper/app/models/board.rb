class Board < ApplicationRecord
  validates :name, :email, :height, :width, :mines_number, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 30 }
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :height, :width, numericality: { greater_than_or_equal_to: 2 }
  validates :mines_number, numericality: { greater_than_or_equal_to: 0 }
  validate :less_mines_than_board_area?

  after_validation :set_slug, only: [:create]

  scope :recently_created, -> { order(created_at: :desc).limit(10) }
  scope :order_by_name, -> { order(name: :asc) }
  scope :order_by_size, -> { order(Arel.sql('height * width DESC')) }
  scope :order_by_difficulty, -> { order(Arel.sql('height * width / mines_number DESC')) }


  def self.search(search_param)
    return Board.all unless search_param.present?

    Board.where('name ~* :search_param OR email ~* :search_param', search_param: search_param)
  end

  def to_param
    "#{id}-#{slug}"
  end

  private

  def less_mines_than_board_area?
    return unless [height, width, mines_number].all?(&:present?)

    return if mines_number <= height * width

    errors.add(:mines_number, 'must be less than the area of the board')
  end

  def set_slug
    return unless name.present?

    self.slug = name.parameterize
  end
end
