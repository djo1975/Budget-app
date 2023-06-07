require 'rails_helper'

RSpec.describe 'transactions/index', type: :view do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:category) { Category.create(name: 'Category 1', user:) }
  let!(:transaction1) { Transaction.create(name: 'Transaction 1', amount: 10, author: user) }
  let!(:transaction2) { Transaction.create(name: 'Transaction 2', amount: 20, author: user) }

  before do
    assign(:category, category)
    assign(:transactions, [transaction1, transaction2])
    assign(:total_amount, 30)
    allow(view).to receive(:current_user).and_return(user)
    render
  end

  it 'displays the heading' do
    expect(rendered).to have_selector('h1', text: 'Transactions')
  end

  it 'displays the total amount' do
    expect(rendered).to have_selector('p', text: 'Total Amount: 30')
  end

  it 'displays the list of transactions' do
    expect(rendered).to have_selector('ul') do |ul|
      expect(ul).to have_selector('li', text: 'Transaction 1')
      expect(ul).to have_selector('li', text: 'Transaction 2')
      expect(ul).to have_selector('li', text: 'TOTAL AMOUNT: $10')
      expect(ul).to have_selector('li', text: 'TOTAL AMOUNT: $20')
    end
  end

  it 'renders a link to add a new transaction' do
    expect(rendered).to have_link('Add a new transaction', href: new_category_transaction_path(category))
  end

  it 'renders a link to go back' do
    expect(rendered).to have_link('', href: root_path) do |link|
      expect(link).to have_css('i.material-icons', text: 'arrow_back')
    end
  end
end
