class AddTransactionIdToTransactionCategories < ActiveRecord::Migration[6.1]
  def change
    change_column_null :transaction_categories, :transaction_id, false
  end
end
