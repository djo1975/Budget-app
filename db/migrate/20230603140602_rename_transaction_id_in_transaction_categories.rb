class RenameTransactionIdInTransactionCategories < ActiveRecord::Migration[7.0]
  def change
    rename_column :transaction_categories, :transaction_id, :transaction_record_id
  end
end
