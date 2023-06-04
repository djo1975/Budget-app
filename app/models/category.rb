class Category < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :transaction_categories, dependent: :destroy
  has_many :transactions, through: :transaction_categories
end
