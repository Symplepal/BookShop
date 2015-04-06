class Book < ActiveRecord::Base

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :purchases, through: :book_purchases
  has_and_belongs_to_many :stores, through: :book_stores
  has_many :book_stores
  has_many :book_purchases
  belongs_to :author
  belongs_to :publisher

end
