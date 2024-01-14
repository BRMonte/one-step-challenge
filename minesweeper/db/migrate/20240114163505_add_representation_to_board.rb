class AddRepresentationToBoard < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :representation, :text, array: true, default: []
  end
end
