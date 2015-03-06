class Item < ActiveRecord::Base
  belongs_to :board
  has_many :event_items
  has_many :events, :through => :event_items
  has_attached_file :avatar, :default_url => "/images/missing.png"
  # validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :photo, :attachment_presence => true
  validates :item_name, :total_price, :board_id, :photo, presence: true
end
