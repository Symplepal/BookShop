class Book < ActiveRecord::Base

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :purchases
  has_and_belongs_to_many :stores
  belongs_to :author
  belongs_to :publisher

end
