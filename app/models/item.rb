class Item < ActiveRecord::Base
  belongs_to :board
  has_many :event_items
  has_many :events, :through => :event_items
  has_attached_file :photo, :default_url => "/images/missing.png"
  has_attached_file :photo, :styles => { :medium => "200x150>", :thumb => "100x100>" },
                :default_url => "/items/:style/missing.png",
                :storage => :s3,
                :bucket => 'mygiver',
                :s3_credentials => S3_CREDENTIALS

  # , :default_url => "/images/:style/missing.png", :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/environments/production.rb", :path => "giver/:attachment/:style/:id.:extension"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates :photo, :attachment_presence => true
  validates :item_name, :total_price, :board_id, :photo, presence: true
end
