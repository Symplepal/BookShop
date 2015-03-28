class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.integer :publisher_id
      t.date :published_date
      t.integer :price
      t.integer :page_count
      t.integer :genre_id

      t.timestamps
    end
  end
end
