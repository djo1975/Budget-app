require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:category) { Category.create(name: 'Category 1', user: user) }

  describe 'GET #index' do
    it 'assigns the category' do
      get :index, params: { category_id: category.id }
      expect(assigns(:category)).to eq(category)
    end

    it 'assigns the transactions' do
      transaction1 = Transaction.create(name: 'Transaction 1', amount: 10, author: user)
      transaction2 = Transaction.create(name: 'Transaction 2', amount: 20, author: user)

      transaction_category1 = TransactionCategory.create(transaction_record: transaction1, category: category)
      transaction_category2 = TransactionCategory.create(transaction_record: transaction2, category: category)

      get :index, params: { category_id: category.id }
      expect(assigns(:transactions)).to eq([transaction2, transaction1]) # transactions are ordered by created_at desc
    end

    it 'assigns the total amount' do
      transaction1 = Transaction.create(name: 'Transaction 1', amount: 10, author: user)
      transaction2 = Transaction.create(name: 'Transaction 2', amount: 20, author: user)

      transaction_category1 = TransactionCategory.create(transaction_record: transaction1, category: category)
      transaction_category2 = TransactionCategory.create(transaction_record: transaction2, category: category)

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

  describe 'POST #create' do
    it 'creates a new transaction and transaction category' do
      expect {
        post :create, params: {
          category_id: category.id,
          transaction: {
            name: 'New Transaction',
            amount: 50
          }
        }
      }.to change(Transaction, :count).by(1).and change(TransactionCategory, :count).by(1)

      transaction = Transaction.last
      transaction_category = TransactionCategory.last

      expect(transaction.name).to eq('New Transaction')
      expect(transaction.amount).to eq(50)
      expect(transaction.author).to eq(user)

      expect(transaction_category.transaction_record).to eq(transaction)
      expect(transaction_category.category).to eq(category)
    end

    it 'redirects to the category transactions page' do
      post :create, params: {
        category_id: category.id,
        transaction: {
          name: 'New Transaction',
          amount: 50
        }
      }

      expect(response).to redirect_to(category_transactions_path(category))
      expect(flash[:notice]).to eq('Transaction created successfully.')
    end

    it 'renders the new template if transaction is not valid' do
      post :create, params: {
        category_id: category.id,
        transaction: {
          name: '',
          amount: 50
        }
      }

      expect(response).to render_template(:new)
    end
  end
end
