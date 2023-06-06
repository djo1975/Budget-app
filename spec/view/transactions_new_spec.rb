require 'rails_helper'

RSpec.describe 'transactions/new', type: :view do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:category) { Category.create(name: 'Category 1', user:) }
  let(:transaction) { Transaction.new }

  before do
    assign(:category, category)
    assign(:transaction, transaction) # Dodeli promenljivu `@transaction`
    assign(:total_amount, 30)
    allow(view).to receive(:current_user).and_return(user)
    render
  end

  it 'displays the heading' do
    expect(rendered).to have_selector('h1', text: 'New Transaction')
  end

  it 'renders the transaction form' do
    expect(rendered).to have_selector('form') do |form|
      expect(form).to have_field('Name')
      expect(form).to have_field('Amount')
      expect(form).to have_button('Create Transaction')
    end
  end

  it 'renders a link to go back' do
    expect(rendered).to have_link('Back', href: category_transactions_path(category))
  end
end
