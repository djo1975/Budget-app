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
      # Proverite da li postoje transakcije za dodavanje
      if params[:transactions_id].present?
        params[:transactions_id].each do |transaction_id|
          @category.transactions << Transaction.find(transaction_id)
        end
      end

      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon_url)
  end
end
