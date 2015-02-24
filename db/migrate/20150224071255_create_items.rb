class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :total_price
      t.references :board, index: true

      t.timestamps
    end
  end
end
