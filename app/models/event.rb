class Event < ActiveRecord::Base
  belongs_to :user
  has_many :contributions
  has_many :users, :through => :contributions
  has_many :comments
  has_many :users, :through => :comments
  has_many :event_items
  has_many :items, :through => :event_items
  attr_accessor :year, :month, :day
  validates :event_name, :user, :presence => true
  validates :deadline, :presence => true
  validate :deadline_must_be_future

  def deadline_must_be_future
    errors.add(:deadline, "can't be in the past") if
      !deadline.blank? and deadline < Date.today
  end
end
