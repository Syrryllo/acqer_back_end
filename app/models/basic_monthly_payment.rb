class BasicMonthlyPayment < ApplicationRecord
  belongs_to :escalation_value
  belongs_to :dwelling
end
