class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :store_id
      t.integer :delivery_method
      t.integer :total_cost

      t.timestamps
    end
  end
end
