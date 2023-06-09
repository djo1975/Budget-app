class Category < ApplicationRecord
  belongs_to :user
  has_many :transaction_categories, foreign_key: :category_id
  has_many :transactions, through: :transaction_categories, source: :transaction_record

  attribute :icon_url, :string
  validates :name, presence: true

  def total_amount
    transactions.sum(:amount)
  end
end
