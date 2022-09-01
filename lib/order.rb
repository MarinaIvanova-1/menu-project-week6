require 'menu'
require 'dish'

class Order
  def initialize(menu, io = Kernel)
    @menu = menu
    @order = []
    @io = io
  end

  def selected
    @menu.list.each do |dish| 
      if dish.selected? == true
        @order << dish
      end
    end
    @order
  end

  def quantity
    @quanity_order = {}
    @order.each do |dish|
      @io.puts "please enter the quantity for #{dish}"
      quantity = @io.gets.chomp.to_i
      @quanity_order[dish] = quantity 
    end
    @quanity_order
  end

  def total
    @total = 0
    @quanity_order.each do |dish, quantity|
      @total += (dish.price * quantity)
    end
    @total
  end

  def receipt
    # binding.irb
    @quanity_order.each do |dish, quantity|
      @io.puts "#{dish.dish_name} - #{quantity}"
    end
    @io.puts "Total to pay: #{@total}"    
  end
end


