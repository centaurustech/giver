class CreateEventItems < ActiveRecord::Migration
  def change
    create_table :event_items do |t|
      t.references :item, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
