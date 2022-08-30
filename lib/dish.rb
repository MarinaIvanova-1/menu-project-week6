# Dish = Struct.new(:dish_name, :price)

class Dish
  def initialize(dish_name, price)
    @dish_name = dish_name
    @price = price
  end

  def dish_name
    @dish_name
  end

  def price
    @price
  end

  def category(type)
    @type = type.to_sym
  end

  def show(io = Kernel)
    @io = io
    @io.puts "#{@dish_name} - #{sprintf('%.2f', @price)}, category: #{@type}"
  end
end