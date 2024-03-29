class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :event_id, :user_id, :content, :presence => true
end
