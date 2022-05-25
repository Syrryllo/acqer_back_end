class Stakeholder < ApplicationRecord
  has_many :shares
  has_many :shareholder_loans
  has_many :bookkeeping_details
  has_many :re_company_stakeholders

#  belongs_to :account_credited, :class_name => 'BookkeepingDetail'
#  belongs_to :account_debited, :class_name => 'BookkeepingDetail'

end
