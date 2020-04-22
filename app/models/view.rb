class View < ApplicationRecord
  belongs_to :poll, :optional => false
end
