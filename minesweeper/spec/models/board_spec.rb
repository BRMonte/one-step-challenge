require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:board) { build(:board) }

  # describe 'validations' do
  #   it "is valid with valid attributes" do
  #     expect(board).to be_valid
  #   end

  #   it "is not valid without a name" do
  #     board.name = nil
  #     expect(board).to_not be_valid
  #   end

  #   it "is not valid without an email" do
  #     board.email = nil
  #     expect(board).to_not be_valid
  #   end

  #   it "is not valid without a height" do
  #     board.height = nil
  #     expect(board).to_not be_valid
  #   end

  #   it "is not valid without a width" do
  #     board.width = nil
  #     expect(board).to_not be_valid
  #   end

  #   it "is not valid without a mines_number" do
  #     board.mines_number = nil
  #     expect(board).to_not be_valid
  #   end

  #   it "is not valid with a name longer than 30 characters" do
  #     board.name = "a" * 31
  #     expect(board).to_not be_valid
  #   end

  #   it "is not valid with a non-unique name" do
  #     create(:board)
  #     board.name = Board.first.name
  #     expect(board).to_not be_valid
  #   end

  #   it "is not valid with a height less than 2" do
  #     board.height = 1
  #     expect(board).to_not be_valid
  #   end

  #   it "is not valid with a width less than 2" do
  #     board.width = 1
  #     expect(board).to_not be_valid
  #   end

  #   it "is not valid with a mines_number greater than the board area" do
  #     board.mines_number = board.height * board.width + 1
  #     expect(board).to_not be_valid
  #   end
  # end

  describe 'scopes' do
    describe '.recently_created' do
      it 'orders by created_at in descending order and limits to 10 records' do
        boards = create_list(:board, 12)
        expect(Board.recently_created).to match_array(boards.last(10))
      end
    end

    describe '.order_by_size' do
      it 'orders by the product of height and width in descending order' do
        boards = create_list(:board, 3, height: 4, width: 4) + create_list(:board, 3, height: 2, width: 2)
        expect(Board.order_by_size).to match_array(boards.sort_by { |board| -board.height * board.width })
      end
    end

    describe '.order_by_difficulty' do
      it 'orders by the ratio of height times width to the number of mines in descending order' do
        boards = create_list(:board, 3, height: 2, width: 2, mines_number: 1) + create_list(:board, 3, height: 3, width: 3, mines_number: 1)
        expect(Board.order_by_difficulty).to eq(boards.sort_by { |board| -board.height * board.width / board.mines_number.to_f })
      end
    end
  end


end
