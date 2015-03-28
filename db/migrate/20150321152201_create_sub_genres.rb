class CreateSubGenres < ActiveRecord::Migration
  def change
    create_table :sub_genres do |t|
      t.string :name
      t.integer :genre_id

      t.timestamps
    end
  end
end
