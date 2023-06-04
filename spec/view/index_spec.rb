require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  let(:user) { User.create(name: 'John Doe', email: 'test@example.com', password: 'password') }

  before do
    assign(:categories, [
             Category.new(name: 'Category 1', icon_url: 'category-icon1', user:),
             Category.new(name: 'Category 2', icon_url: 'category-icon2', user:)
           ])
  end

  it 'displays the categories' do
    render

    expect(rendered).to have_content('Category 1')
    expect(rendered).to have_content('Category 2')
    expect(rendered).to have_css("img[src='category-icon1']")
    expect(rendered).to have_css("img[src='category-icon2']")
  end

  it 'renders a link to add a new category' do
    render

    expect(rendered).to have_link('Add a new category', href: new_category_path)
  end
end
