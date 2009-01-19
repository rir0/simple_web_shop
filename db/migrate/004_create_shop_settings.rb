class CreateShopSettings < ActiveRecord::Migration
  def self.up
    create_table :shop_settings do |t|
      t.string    :email_to
      t.string    :email_from
      t.decimal   :shipping_cost, {:precision => 5, :scale => 2}
      t.decimal   :shipping_cost_limit, {:precision => 5, :scale => 2}
      t.string    :currency

      t.timestamps
    end

    ShopSetting.create :email_to => "your-email@your-site.cc", 
                       :email_from => "noreply@your-site.cc", 
                       :shipping_cost => 8.50, 
                       :shipping_cost_limit => 75.00, 
                       :currency => "CHF"
  end

  def self.down
    drop_table :shop_settings
  end
end
