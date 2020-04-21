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
end
