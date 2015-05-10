class AddForeignKeysAndIndexes < ActiveRecord::Migration
  def change
    add_index :books, :author_id
    add_index :books, :publisher_id
    add_index :purchases, :user_id
  end
end
