class UpdateCategoriesTable < ActiveRecord::Migration[7.0]
  def change
    change_column :categories, :icon, :string, default: ''
    add_column :categories, :icon_url, :string, default: ''
  end
end
