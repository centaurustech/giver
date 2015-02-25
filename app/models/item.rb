class Item < ActiveRecord::Base
  belongs_to :board
  has_many :event_items
  has_many :events, :through => :event_items
end
