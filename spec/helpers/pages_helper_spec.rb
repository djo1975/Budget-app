require 'rails_helper'

RSpec.describe PagesHelper do
  describe '#custom_helper_method' do
    it 'returns the correct value' do
      expect(helper.custom_helper_method).to eq('Hello, World!')
    end
  end
end
