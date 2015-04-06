class Store < ActiveRecord::Base
  has_many :book_stores, dependent: :destroy
  has_many :books, through: :book_stores

  accepts_nested_attributes_for :book_stores, :allow_destroy => true
end
