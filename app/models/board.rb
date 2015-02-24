class Board < ActiveRecord::Base
  belongs_to :user
  has_many :items
  validates :board_name, :presence => true
end
