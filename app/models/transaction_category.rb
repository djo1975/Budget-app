class TransactionCategory < ApplicationRecord
  belongs_to :category, foreign_key: :category_id
  belongs_to :transaction_record, foreign_key: :transaction_record_id, class_name: 'Transaction'
end
