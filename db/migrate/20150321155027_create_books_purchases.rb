class CreateBooksPurchases < ActiveRecord::Migration
  def change
    create_table :books_purchases, id: false do |t|
      t.belongs_to :book, index: true
      t.belongs_to :purchase, index: true
      t.integer :amount
    end
  end
end
