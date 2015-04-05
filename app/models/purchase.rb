class Purchase < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :books, through: :books_purchases
end
