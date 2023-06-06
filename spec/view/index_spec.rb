require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  let(:user) { User.create(name: 'John Doe', email: 'test@example.com', password: 'password') }

  before do
    assign(:categories, Category.all)
  end

  it 'renders a button to add a new category' do
    render

    expect(rendered).to have_button('Add a new category')
  end

  it 'renders links to category transactions' do
    render

    Category.all.each do |category|
      expect(rendered).to have_link('Transactions', href: category_transactions_path(category_id: category.id))
    end
  end
end
