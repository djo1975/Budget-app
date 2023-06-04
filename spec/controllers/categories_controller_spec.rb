require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    it 'assigns @categories' do
      user = User.create(name: 'John Doe', email: 'test@example.com', password: 'password')
      sign_in user
      category1 = Category.create(name: 'Category 1', user:, icon: 'category-icon1')
      category2 = Category.create(name: 'Category 2', user:, icon: 'category-icon2')

      get :index
      expect(assigns(:categories)).to eq([category1, category2])
    end

    it 'renders the index template' do
      user = User.create(name: 'John Doe', email: 'test@example.com', password: 'password')
      sign_in user

      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assigns a new category' do
      user = User.create(name: 'John Doe', email: 'test@example.com', password: 'password')
      sign_in user

      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new category' do
        user = User.create(name: 'John Do', email: 'test@example.com', password: 'password')
        sign_in user
        category_params = { name: 'New Category', user_id: user.id }

        expect do
          post :create, params: { category: category_params }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to categories#index' do
        user = User.create(name: 'John Do', email: 'test@example.com', password: 'password')
        sign_in user
        category_params = { name: 'New Category', user_id: user.id }

        post :create, params: { category: category_params }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new category' do
        user = User.create(name: 'John Do', email: 'test@example.com', password: 'password')
        sign_in user
        category_params = { name: '', user_id: user.id }

        expect do
          post :create, params: { category: category_params }
        end.not_to change(Category, :count)
      end

      it 'renders the new template' do
        user = User.create(name: 'John Do', email: 'test@example.com', password: 'password')
        sign_in user
        category_params = { name: '', user_id: user.id }

        post :create, params: { category: category_params }
        expect(response).to render_template(:new)
      end
    end
  end
end
