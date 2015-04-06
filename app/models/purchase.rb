class Purchase < ActiveRecord::Base
  belongs_to :user
  has_many :book_purchases, dependent: :destroy
  has_many :books, through: :book_purchases

  accepts_nested_attributes_for :book_purchases, :allow_destroy => true
end
