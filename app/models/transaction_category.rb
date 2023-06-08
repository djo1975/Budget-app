class TransactionCategory < ApplicationRecord
  belongs_to :transaction, class_name: 'Transaction', foreign_key: 'transaction_id'
  belongs_to :category

  has_many :transactions, through: :transaction
end
