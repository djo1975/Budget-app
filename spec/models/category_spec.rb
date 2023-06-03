require 'rails_helper'

RSpec.describe Category do
  it 'is valid with a name and user' do
    user = User.create(name: 'John')
    category = described_class.new(name: 'Food', user:)
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(name: 'John')
    category = described_class.new(name: nil, user:)
    expect(category).not_to be_valid
  end

  it 'is invalid without a user' do
    category = described_class.new(name: 'Food', user: nil)
    expect(category).not_to be_valid
  end
end
