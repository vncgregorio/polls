# == Schema Information
#
# Table name: polls
#
#  id          :bigint           not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Poll < ApplicationRecord
  has_many :views
  has_many :options

  validates_presence_of :description
end
