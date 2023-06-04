# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User do
  it 'is valid with a name' do
    user = described_class.new(name: 'John Doe', email: 'john@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = described_class.new(name: nil)
    expect(user).not_to be_valid
  end

  it 'is invalid without name' do
    user = described_class.new(
      email: 'test@example.com',
      password: 'password'
    )
    expect(user).not_to be_valid
  end

  it 'is not valid without an email' do
    user = described_class.new(email: nil, password: 'password')
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user = described_class.new(email: 'test@example.com', password: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid with a duplicate email' do
    described_class.create(email: 'test@example.com', password: 'password')
    user = described_class.new(email: 'test@example.com', password: 'password')
    expect(user).not_to be_valid
  end
end
