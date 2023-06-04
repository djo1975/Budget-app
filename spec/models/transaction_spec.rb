require 'rails_helper'

RSpec.describe Transaction do
  it 'is valid with a name, author, and amount' do
    user = User.create(name: 'John')
    transaction = described_class.new(name: 'Groceries', author: user, amount: 50.0)
    expect(transaction).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(name: 'John')
    transaction = described_class.new(name: nil, author: user, amount: 50.0)
    expect(transaction).not_to be_valid
  end

  it 'is invalid without an author' do
    transaction = described_class.new(name: 'Groceries', author: nil, amount: 50.0)
    expect(transaction).not_to be_valid
  end

  it 'is invalid without an amount' do
    user = User.create(name: 'John')
    transaction = described_class.new(name: 'Groceries', author: user, amount: nil)
    expect(transaction).not_to be_valid
  end
end
