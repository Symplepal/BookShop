class CreateBookPurchases < ActiveRecord::Migration
  def change
    create_table :book_purchases do |t|
      t.belongs_to :book, index: true
      t.belongs_to :purchase, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
