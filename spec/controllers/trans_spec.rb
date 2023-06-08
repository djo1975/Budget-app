require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'GET #index' do
    let(:category) { create(:category) }

    context 'when category exists' do
      it 'assigns the category and transactions' do
        get :index, params: { category_id: category.id }
        expect(assigns(:category)).to eq(category)
        expect(assigns(:transactions)).to eq(category.transactions.order(created_at: :desc))
        expect(assigns(:total_amount)).to eq(category.total_amount)
      end

      it 'renders the index template' do
        get :index, params: { category_id: category.id }
        expect(response).to render_template(:index)
      end
    end

    context 'when category does not exist' do
      it 'raises an error' do
        expect {
          get :index, params: { category_id: 'invalid_id' }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  # Add more tests for other actions (new, create) if needed
end
