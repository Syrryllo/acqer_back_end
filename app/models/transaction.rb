class Transaction < ApplicationRecord
  belongs_to :account_credited
  belongs_to :account_debited
end
