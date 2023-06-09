# db/migrate/20230604095323_create_budget_tables.rb

class CreateBudgetTables < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'plpgsql'

    create_table :categories do |t|
      t.string :name
      t.bigint :user_id, null: false
      t.string :icon, default: ''
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :icon_url, default: ''
      t.index :user_id, name: 'index_categories_on_user_id'
    end

    create_table :transaction_categories do |t|
      t.bigint :transaction_id, null: false
      t.bigint :category_id, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index :category_id, name: 'index_transaction_categories_on_category_id'
      t.index :transaction_id, name: 'index_transaction_categories_on_transaction_id'
    end

    create_table :transactions do |t|
      t.string :name
      t.bigint :author_id, null: false
      t.decimal :amount
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index :author_id, name: 'index_transactions_on_author_id'
    end

    create_table :users do |t|
      t.string :name
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :email, default: '', null: false
      t.string :encrypted_password, default: '', null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.index :email, name: 'index_users_on_email', unique: true
      t.index :reset_password_token, name: 'index_users_on_reset_password_token', unique: true
    end

    add_foreign_key :categories, :users
    add_foreign_key :transaction_categories, :categories
  end
end
