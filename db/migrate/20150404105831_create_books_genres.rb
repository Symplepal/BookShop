class CreateBooksGenres < ActiveRecord::Migration
  def change
    create_table :books_genres, id: false do |t|
      t.belongs_to :book, index: true
      t.belongs_to :genre, index: true

      t.timestamps
    end
  end
end
