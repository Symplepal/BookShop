class BookPurchase < ActiveRecord::Base
  belongs_to :book
  belongs_to :purchase

end