class Admin::SettingsController < ApplicationController

  def index
    @item = ShopSetting.find_by_id(1)

    if request.post? and @item.update_attributes(params[:item])
      flash[:notice] = "Settings updated"
      redirect_to :action => "index" if params[:commit] != nil
    end
  end


end
