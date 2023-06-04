require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  let(:user) { User.create(name: 'John Doe', email: 'test@example.com', password: 'password') }

  before do
    assign(:category, Category.new)
    allow(view).to receive(:current_user).and_return(user)
  end

  it 'renders the form to create a new category' do
    render

    expect(rendered).to have_content('Add a new category')
    expect(rendered).to have_selector('form[action="/categories"]')
    expect(rendered).to have_field('Name')
    expect(rendered).to have_field('Icon URL')
    expect(rendered).to have_button('Save')
    expect(rendered).to have_link('Back', href: categories_path)
  end
end
