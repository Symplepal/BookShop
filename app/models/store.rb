class Store < ActiveRecord::Base
  has_and_belongs_to_many :books
  has_many :book_stores
  accepts_nested_attributes_for :book_stores, :allow_destroy => true
end
