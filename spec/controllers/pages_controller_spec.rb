require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #splash' do
    context 'when user is signed in' do
      before do
        @user = User.create(name: 'John Doe', email: 'test@example.com', password: 'password')
        sign_in @user
      end

      it 'redirects to categories#index' do
        get :splash
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'when user is not signed in' do
      it 'renders the splash template' do
        get :splash
        expect(response).to render_template(:splash)
      end
    end
  end
end
