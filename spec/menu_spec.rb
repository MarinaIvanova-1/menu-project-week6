require 'menu'

RSpec.describe Menu do
  it "shows an empty list if there are no items in the menu" do
    my_menu = Menu.new()
    expect(my_menu.all).to eq []
  end

  it "shows all the dishes in the menu" do
    my_menu = Menu.new()
    dish_1 = double :dish, dish_name: "pasta", price: 10.00
    dish_2 = double :dish, dish_name: "salad", price: 5.00
    my_menu.add(dish_1)
    my_menu.add(dish_2)
    expect(my_menu.all).to eq [dish_1, dish_2]
  end

  it "formats the list of dishes in a nice way" do
    io = double :io
    expect(io).to receive(:puts).with("1. Pasta - 10.00")
    my_menu = Menu.new(io)
    dish_1 = double :dish, dish_name: "pasta", price: 10.00
    my_menu.add(dish_1)
    my_menu.show
  end

  it "formats the list of dishes in a nice way" do
    io = double :io
    my_menu = Menu.new(io)
    dish_1 = double :dish, dish_name: "pasta", price: 10.00
    dish_2 = double :dish, dish_name: "salad", price: 5.00
    my_menu.add(dish_1)
    my_menu.add(dish_2)
    expect(io).to receive(:puts).with("1. Pasta - 10.00")
    expect(io).to receive(:puts).with("2. Salad - 5.00")
    my_menu.show
  end

end