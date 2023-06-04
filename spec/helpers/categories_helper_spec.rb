# require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CategoriesHelper. For example:
#
# describe CategoriesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

require 'rails_helper'

RSpec.describe CategoriesHelper do
  describe '#custom_helper_method' do
    it 'returns the correct value' do
      expect(helper.custom_helper_method).to eq('Hello, World!')
    end
  end
end
