class CreateBookStores < ActiveRecord::Migration
  def change
    create_table :book_stores do |t|
      t.belongs_to :store, index: true
      t.belongs_to :book, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
