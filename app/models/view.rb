# == Schema Information
#
# Table name: views
#
#  id         :bigint           not null, primary key
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class View < ApplicationRecord
  belongs_to :poll, :optional => false
end
