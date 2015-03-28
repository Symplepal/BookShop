class Genre < ActiveRecord::Base
  has_many :sub_genres
end
