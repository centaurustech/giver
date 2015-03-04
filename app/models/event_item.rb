class EventItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :event

  ##needs a validation to make sure duplicates don't go into db
  ## a duplicate would be items with the same combination of item_id and event_id
  ##also each event should only have one item
  validates :event_id, uniqueness: true
  validates :item_id, :event_id, presence: true
end
