require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:category) { Category.create(name: 'Category 1', user:) }

  describe 'GET #index' do
    it 'assigns the category' do
      get :index, params: { category_id: category.id }
      expect(assigns(:category)).to eq(category)
    end

    it 'assigns the transactions' do
      transaction1 = Transaction.create(name: 'Transaction 1', amount: 10, author: user)
      transaction2 = Transaction.create(name: 'Transaction 2', amount: 20, author: user)

      TransactionCategory.create(transaction_record: transaction1, category:)
      TransactionCategory.create(transaction_record: transaction2, category:)

      get :index, params: { category_id: category.id }
      expect(assigns(:transactions)).to eq([transaction2, transaction1]) # transactions are ordered by created_at desc
    end

    it 'assigns the total amount' do
      transaction1 = Transaction.create(name: 'Transaction 1', amount: 10, author: user)
      transaction2 = Transaction.create(name: 'Transaction 2', amount: 20, author: user)

      TransactionCategory.create(transaction_record: transaction1, category:)
      TransactionCategory.create(transaction_record: transaction2, category:)

      get :index, params: { category_id: category.id }
      expect(assigns(:total_amount)).to eq(30)
    end

    it 'renders the index template' do
      get :index, params: { category_id: category.id }
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assigns the category' do
      get :new, params: { category_id: category.id }
      expect(assigns(:category)).to eq(category)
    end

    it 'renders the new template' do
      get :new, params: { category_id: category.id }
      expect(response).to render_template(:new)
    end
  end
end
