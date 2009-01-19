class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string   :name
      t.string   :firstname
      t.string   :street
      t.string   :city
      t.string   :email
      t.text     :order
      t.text     :comment,       :default => ""
      t.column   :quantity,      :integer, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
