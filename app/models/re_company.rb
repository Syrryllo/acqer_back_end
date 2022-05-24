class ReCompany < ApplicationRecord
  has_many :re_company_dwellings
  has_many :re_company_stakeholders
end
