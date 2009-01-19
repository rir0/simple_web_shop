require File.dirname(__FILE__) + '/../spec_helper'

describe OrderItems do
  before(:each) do
    @order_items = OrderItems.new
  end

  it "should be valid" do
    @order_items.should be_valid
  end
end
