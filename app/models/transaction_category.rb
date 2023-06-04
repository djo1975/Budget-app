class TransactionCategory < ApplicationRecord
  belongs_to :transaction_record, class_name: 'Transaction'
  belongs_to :category
end
