class TransactionCategory < ApplicationRecord
  belongs_to :category
  belongs_to :transaction_record, class_name: 'Transaction', foreign_key: 'transaction_id'
end
