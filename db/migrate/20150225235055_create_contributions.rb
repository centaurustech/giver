class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :amount
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
