class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.column :order_id,      :integer, :null => false
      t.column :product_id,    :integer, :null => false
      t.column :quantity,      :integer, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :order_items
  end
end
