class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string    :title
      t.text      :description
      t.decimal   :price, {:precision => 5, :scale => 2}

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
