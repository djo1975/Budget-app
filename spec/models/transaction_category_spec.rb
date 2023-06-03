require 'rails_helper'

RSpec.describe TransactionCategory do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John')
    category = Category.create(name: 'Food', user:)
    transaction = Transaction.create(name: 'Groceries', author: user, amount: 50.0)
    transaction_category = described_class.new(transaction_record: transaction, category:)
    expect(transaction_category).to be_valid
  end

  it 'is invalid without a transaction_record' do
    category = Category.create(name: 'Food')
    transaction_category = described_class.new(transaction_record: nil, category:)
    expect(transaction_category).not_to be_valid
  end

  it 'is invalid without a category' do
    user = User.create(name: 'John')
    transaction = Transaction.create(name: 'Groceries', author: user, amount: 50.0)
    transaction_category = described_class.new(transaction_record: transaction, category: nil)
    expect(transaction_category).not_to be_valid
  end
end
