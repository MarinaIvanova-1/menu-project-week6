require 'menu'
require 'dish'

RSpec.describe Menu do
  it "formats the list of dishes in a nice way" do 
    io = double :io
    my_menu = Menu.new(io)
    dish_1 = Dish.new("pasta", 10.00)
    dish_2 = Dish.new("salad", 5.00)
    my_menu.add(dish_1)
    my_menu.add(dish_2)
    expect(io).to receive(:puts).with("1. Pasta - 10.00")
    expect(io).to receive(:puts).with("2. Salad - 5.00")
    my_menu.show
  end
end

