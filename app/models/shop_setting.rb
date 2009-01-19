class ShopSetting < ActiveRecord::Base
  validates_presence_of :email_to, :email_from, :shipping_cost, :shipping_cost_limit, :currency

  validates_numericality_of :shipping_cost, :shipping_cost_limit
end
