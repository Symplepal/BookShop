class BookStore < ActiveRecord::Base
  belongs_to :book
  belongs_to :store


end