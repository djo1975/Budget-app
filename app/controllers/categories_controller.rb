class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @transactions = @category.transactions
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
  
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name, :icon)
  end  
end
