class Category < ApplicationRecord
  belongs_to :user
  has_many :transaction_categories
  has_many :transactions, through: :transaction_categories, source: :transaction_record

  def total_amount
    transactions.sum(:amount)
  end
end
