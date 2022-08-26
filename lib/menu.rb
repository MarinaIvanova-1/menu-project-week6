require 'dish'

class Menu
  def initialize(io = Kernel)
    @menu = []
    @io = io
  end

  def add(dish)
    @menu << dish
  end

  def all
    @menu
  end

  def show
    num = 1
    for dish in @menu do
      @io.puts "#{num}. #{dish.dish_name.capitalize()} - #{sprintf('%.2f', dish.price)}"
      num += 1
    end
  end
end