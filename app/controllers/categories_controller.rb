class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.includes(:transactions)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    if @category.save
      @transaction = Transaction.create(name: 'Initial Transaction', author: current_user, amount: 0)
      @transaction.transaction_categories.create(category_id: @category.id)
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon_url)
  end
end
