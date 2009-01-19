# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SimpleWebShopExtension < Radiant::Extension
  version "0.1"
  description "A simple web shop"
  url "http://yourwebsite.com/simple_web_shop"
  
  define_routes do |map|
    map.connect '/shop/:action', :controller => 'shop'

    map.with_options(:controller => 'admin/products') do |sws|
      sws.prod_index         'admin/simple_web_shop',                 :action => 'index'
      sws.prod_new           'admin/simple_web_shop/new',             :action => 'new'
      sws.prod_edit          'admin/simple_web_shop/edit/:id',        :action => 'edit'
      sws.prod_remove        'admin/simple_web_shop/remove/:id',      :action => 'remove'
    end

    map.with_options(:controller => 'admin/orders') do |sws|
      sws.orders_overview   'admin/simple_web_shop/orders',           :action => 'index'
      sws.orders_detail     'admin/simple_web_shop/orders/show/:id',  :action => 'show'
    end

    map.with_options(:controller => 'admin/settings') do |sws|
      sws.settings           'admin/simple_web_shop/settings',         :action => 'index'
    end

  end
  
  def activate
    admin.tabs.add "Web Shop", "/admin/simple_web_shop", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    admin.tabs.remove "Web Shop"
  end
  
end
