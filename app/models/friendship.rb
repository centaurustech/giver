class Friendship < ActiveRecord::Base
  belongs_to :friend, :class_name => 'User'
  validates :user_id, :friend_id, :presence => true
end
