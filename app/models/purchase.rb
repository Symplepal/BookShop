class Purchase < ActiveRecord::Base
  belongs_to :user
  has_many :book_purchases, dependent: :destroy
  has_many :books, through: :book_purchases

  accepts_nested_attributes_for :book_purchases, :allow_destroy => true

  def total_cost
    total_cost = 0
    self.book_purchases.each do |book_purchase|
     total_cost += book_purchase.quantity * Book.find(book_purchase.book).price
    end
    total_cost
  end
end
