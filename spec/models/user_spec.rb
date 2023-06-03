# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User do
  it 'is valid with a name' do
    user = described_class.new(name: 'John Doe')
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = described_class.new(name: nil)
    expect(user).not_to be_valid
  end
end
