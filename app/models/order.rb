class Order < ActiveRecord::Base


  validates_presence_of :name, :firstname, :street, :city, :email

  validates_format_of(:email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                        :message => "not a valid email address") 

  validate              :must_have_quantity

  def must_have_quantity
    errors.add_to_base("Please choose a product") unless self.quantity > 0 
  end


  def self.quantities
    [0, 1, 2, 3, 4, 5, 6]
  end

  def self.printTwoDigits(number)
    s = number.to_s
    if (s.match(/\.\d$/))
      s << "0"
    end
    s.rjust(7)
  end

  def update_items(items, products, settings)
    total = 0
    self.quantity = 0
    self.order = ""
    items.each do |key, value| 
      self.quantity +=  value
      if value != 0
        products.each do |p|
          if p.id == key
            price = p.price * value
            total = total + price
            txt = value.to_s.rjust(2) + "x " + p.title.ljust(20) + " zu "
            txt << Order.printTwoDigits(p.price)
            txt << " : "
            txt << Order.printTwoDigits(price)
            self.order << txt + "\n"
          end
        end

      end
    end

    if self.quantity == 0
      self.order = ""
    else 
      # add shipping costs ?
      if (total < settings.shipping_cost_limit)
        total += settings.shipping_cost
        self.order << "    Shipping costs".ljust(38)
        self.order << Order.printTwoDigits(settings.shipping_cost)
      end
      
      self.order << "\n " + "______".rjust(43) 

      self.order << "\n    Total #{settings.currency}: ".ljust(39)  
      self.order << Order.printTwoDigits(total.to_s.rjust(7))
    end
  end

  private

end
