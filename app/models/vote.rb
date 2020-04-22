# == Schema Information
#
# Table name: votes
#
#  id         :bigint           not null, primary key
#  option_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Vote < ApplicationRecord
  belongs_to :option, :optional => false
end
