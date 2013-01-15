class CreatePositions < ActiveRecord::Migration
  def up
    create_table :positions do |t|
      t.integer :cart_id
      t.integer :item_id
      t.integer :quantity
      t.timestamps
    end
    drop_table :carts_items
  end
end
