require File.dirname(__FILE__) + '/../spec_helper'

describe Order do
  before(:each) do
    @order = Order.new
  end

  it "should be valid" do
    @order.should be_valid
  end
end
