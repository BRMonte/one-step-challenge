class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.string :email
      t.integer :height
      t.integer :width
      t.integer :mines_number

      t.timestamps
    end
  end
end
