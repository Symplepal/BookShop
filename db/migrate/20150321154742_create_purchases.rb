class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :delivery_method
      t.string :state
      t.integer :user_id

      t.timestamps
    end
  end
end
