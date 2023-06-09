class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @categories = current_user.categories.includes(:transactions)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon_url, :user_id)
  end
end
