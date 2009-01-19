class ShopController < ApplicationController
  no_login_required

  def index
    @page = Page.find_by_url("/shop")

    if @page.nil?
      render :template => 'site/not_found', :status => 404
      return;
    end

    @page.process(request, response)
    template = response.body


    @products = Product.find(:all)
    @order = Order.new(params[:order])

    # hash used to store Product.id and the corresponding quantity
    # selected in the form
    @items = Hash.new()
    for p in @products
      value = 0
      value = params["prod_"][p.id.to_s].to_i if params["prod_"]
      @items.merge!({p.id => value})
    end


    if request.post? 
      settings = ShopSetting.find_by_id(1)
      @order.update_items(@items, @products, settings)

      logger.info "++ total items: " + @order.quantity.to_s

      if @order.save
        OrderMailer.deliver_order_email(@order, settings)
        if @order.email != nil and @order.email != "" 
          OrderMailer.deliver_confirmation_email(@order, settings)
        end
        redirect_to "/danke" 
        return
      end
    end

    render :action => "buy", :layout=> false

    response.body = template.sub(/<shoptag>/, response.body)
  end


end
