# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_603_140_602) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.bigint 'user_id', null: false
    t.string 'icon'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_categories_on_user_id'
  end

  create_table 'transaction_categories', force: :cascade do |t|
    t.bigint 'transaction_record_id', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_transaction_categories_on_category_id'
    t.index ['transaction_record_id'], name: 'index_transaction_categories_on_transaction_record_id'
  end

  create_table 'transactions', force: :cascade do |t|
    t.string 'name'
    t.bigint 'author_id', null: false
    t.decimal 'amount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_transactions_on_author_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'categories', 'users'
  add_foreign_key 'transaction_categories', 'categories'
  add_foreign_key 'transaction_categories', 'transactions', column: 'transaction_record_id'
  add_foreign_key 'transactions', 'users', column: 'author_id'
end
