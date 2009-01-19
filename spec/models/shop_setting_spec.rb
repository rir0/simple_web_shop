require File.dirname(__FILE__) + '/../spec_helper'

describe ShopSetting do
  before(:each) do
    @shop_setting = ShopSetting.new
  end

  it "should be valid" do
    @shop_setting.should be_valid
  end
end
