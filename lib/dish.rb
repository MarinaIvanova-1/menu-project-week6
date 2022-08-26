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
end