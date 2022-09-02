require_relative 'dish'

class Menu
  def initialize
    @menu = []
  end

  def add(dish)
    @menu << dish
  end

  def list
    @menu
  end

  def show(io = Kernel)
    @io = io
    for dish in @menu
      @io.puts "#{dish.dish_name} - #{sprintf('%.2f', dish.price)}"
    end
  end
end
