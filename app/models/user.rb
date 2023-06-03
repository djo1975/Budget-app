class User < ApplicationRecord
  validates :name, presence: true
  has_many :categories, dependent: :destroy
  has_many :transactions, foreign_key: :author_id, dependent: :destroy, inverse_of: :author
end
