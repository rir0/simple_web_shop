require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::OrdersController do

  before(:each) do
    login_as :admin
  end

  #Delete this example and add some real ones
  it "should use OrdersController" do
    controller.should be_an_instance_of(OrdersController)
  end

end
