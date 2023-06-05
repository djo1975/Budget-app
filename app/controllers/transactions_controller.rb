class TransactionsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.transactions.order(created_at: :desc)
    @total_amount = @category.total_amount
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.build
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.build(transaction_params.merge(author_id: current_user.id))

    if @transaction.save
      @transaction.transaction_categories.create(category_id: @category.id)
      redirect_to category_transactions_path(@category), notice: 'Transaction created successfully.'
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, category_ids: [])
  end
end
