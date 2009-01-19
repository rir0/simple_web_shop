class Admin::ProductsController < ApplicationController

  def index
    @items = Product.find(:all)
  end


  def new
    @item = Product.new(params[:item])

    if request.post? and @item.save
      flash.now[:notice] = "Product added"
      redirect_to :action => "index" if params[:commit] != nil
    end

  end


  def edit
    @item = Product.find_by_id(params[:id])

    if request.post? and @item.update_attributes(params[:item])
      flash[:notice] = "Product updated"
      redirect_to :action => "index" if params[:commit] != nil
    end
  end


  def remove
    flash[:notice] = "Product removed" if Product.find(params[:id]).destroy
    redirect_to :action => "index"
  end

end
