class Option < ApplicationRecord
  belongs_to :poll, :optional => false
  has_many :votes

  validates_presence_of :number
  validates_presence_of :description
end
