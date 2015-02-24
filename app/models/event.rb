class Event < ActiveRecord::Base
  belongs_to :user
  has_many :users, :through => :comments
  attr_accessor :year, :month, :day
  validates :event_name, :user, :presence => true
  validates :deadline, :presence => true
  validate :deadline_must_be_future

  def deadline_must_be_future
    errors.add(:deadline, "can't be in the past") if
      !deadline.blank? and deadline < Time.new
  end
end
