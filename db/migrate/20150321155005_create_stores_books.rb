class CreateStoresBooks < ActiveRecord::Migration
  def change
    create_table :stores_books, id: false do |t|
      t.belongs_to :store, index: true
      t.belongs_to :book, index: true
      t.integer :amount
    end
  end
end
