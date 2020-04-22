class Vote < ApplicationRecord
  belongs_to :option, :optional => false
end
