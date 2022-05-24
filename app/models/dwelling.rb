class Dwelling < ApplicationRecord
  has_many :dwelling_valuations
  has_many :basic_monthly_payments
  has_many :lots
end
