require 'rails_helper'

RSpec.describe "Boards", type: :request do
  describe "GET /boards" do
    it "returns http success" do
      get boards_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /boards/:id" do
    let!(:board) { create(:board) }

    it "returns http success" do
      get board_path(board)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /boards" do
    context "with valid params" do
      it "creates a new Board" do
        expect {
        post boards_path, params: { board: attributes_for(:board) }
        }.to change(Board, :count).by(1)
      end
    end
  end
end

