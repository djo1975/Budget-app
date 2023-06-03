require 'rails_helper'

RSpec.describe 'Pages' do
  describe 'GET /splash' do
    it 'renders the splash page' do
      get splash_path
      expect(response).to have_http_status(:ok)
    end
  end
end
