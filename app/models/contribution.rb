class Contribution < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :amount, :user_id, :event_id, presence: true
end
