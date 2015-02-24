class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :deadline
      t.references :user, index: true

      t.timestamps
    end
  end
end
