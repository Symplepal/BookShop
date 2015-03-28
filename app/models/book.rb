class Book < ActiveRecord::Base

  belongs_to :genre, class_name: :sub_genre
  belongs_to :author
  belongs_to :publisher

end
