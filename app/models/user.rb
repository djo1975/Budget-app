class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, dependent: :destroy
  has_many :transactions, foreign_key: :author_id, dependent: :destroy, inverse_of: :author

  validates :name, presence: true
end
