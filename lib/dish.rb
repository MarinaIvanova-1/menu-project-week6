class Dish
  def initialize(dish_name, price, time = 15)
    @dish_name = dish_name
    @price = price
    @time = time
    @selected = false
  end

  def dish_name
    @dish_name
  end

  def price
    @price
  end

  def time
    @time
  end

  def select
    @selected = true
  end

  def unselect
    @selected = false
  end

  def selected?
    true if @selected == true
  end

end