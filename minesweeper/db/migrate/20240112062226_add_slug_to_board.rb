class AddSlugToBoard < ActiveRecord::Migration[7.1]
  def change
    add_column :boards, :slug, :string
  end
end
