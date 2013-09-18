class AddTotalToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :total, :float
  end
end
