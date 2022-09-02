require_relative 'menu'
require_relative 'dish'

class MenuFormatter
  def initialize(menu, io = Kernel)
    @menu = menu
    @io = io
  end

  def show
    num = 1
    @menu.list.each do |dish|
      # binding.irb
      @io.puts "#{num}. #{dish.dish_name.capitalize} - #{sprintf('%.2f', dish.price)}"
      num += 1
    end
  end
end

# require 'menu'
# require 'dish'

# class MenuFormatter
#   def initialize(menu, io = Kernel)
#     @io = io
#     @menu = menu
#   end

#   def show
#     for dish in @menu.list
#       # binding.irb
#       @io.puts "pasta"
#     end
#     # @menu.list.each do |dish|
#     #   # @io.puts "pasta - 10.00"
#     #   # @io.puts "salad - 5.00"
#     #   @io.puts "1"
#     #   # @io.puts "#{dish.dish_name} - #{sprintf('%.2f', dish.price)}"
#     # end
#   end
# end