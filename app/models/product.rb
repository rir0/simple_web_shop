class Product < ActiveRecord::Base
  validates_presence_of     :title, :description, :price

  validates_numericality_of :price
end
