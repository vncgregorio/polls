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

  def poll_description=(value)
    self.description = value
  end

  def options=(arr)
    arr.each do |item|
      self.options.build(
        :description => item
      )
    end
  end
end
