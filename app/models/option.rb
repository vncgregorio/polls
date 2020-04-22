# == Schema Information
#
# Table name: options
#
#  id          :bigint           not null, primary key
#  poll_id     :integer
#  number      :integer
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Option < ApplicationRecord
  belongs_to :poll, :optional => false
  has_many :votes

  auto_increment :number,
    :scope => :poll_id,
    :force => true

  validates_presence_of :description
end
