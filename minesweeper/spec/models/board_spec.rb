require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:board) { build(:board) }

  it "is valid with valid attributes" do
    expect(board).to be_valid
  end

  it "is not valid without a name" do
    board.name = nil
    expect(board).to_not be_valid
  end

  it "is not valid without an email" do
    board.email = nil
    expect(board).to_not be_valid
  end

  it "is not valid without a height" do
    board.height = nil
    expect(board).to_not be_valid
  end

  it "is not valid without a width" do
    board.width = nil
    expect(board).to_not be_valid
  end

  it "is not valid without a mines_number" do
    board.mines_number = nil
    expect(board).to_not be_valid
  end

  it "is not valid with a name longer than 30 characters" do
    board.name = "a" * 31
    expect(board).to_not be_valid
  end

  it "is not valid with a non-unique name" do
    create(:board)
    board.name = Board.first.name
    expect(board).to_not be_valid
  end

  it "is not valid with a height less than 2" do
    board.height = 1
    expect(board).to_not be_valid
  end

  it "is not valid with a width less than 2" do
    board.width = 1
    expect(board).to_not be_valid
  end

  it "is not valid with a mines_number greater than the board area" do
    board.mines_number = board.height * board.width + 1
    expect(board).to_not be_valid
  end
end
