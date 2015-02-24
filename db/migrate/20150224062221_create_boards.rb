class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :board_name
      t.references :user, index: true

      t.timestamps
    end
  end
end
