class Lot < ApplicationRecord
  belongs_to :building
  belongs_to :dwelling
end
