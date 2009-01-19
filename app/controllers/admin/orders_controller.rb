class Admin::OrdersController < ApplicationController

  def index
    @items = Order.find(:all)
  end

  def show
    @item = Order.find_by_id(params[:id])
  end

end
