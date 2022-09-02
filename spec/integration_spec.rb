require 'dish'
require 'menu'
require 'order'
require 'menu_formatter'

RSpec.describe "integration" do
  it "formats the menu in a nice way" do
    io = double :io
    expect(io).to receive(:puts).with("1. Pasta - 10.00")
    expect(io).to receive(:puts).with("2. Salad - 5.00")
    my_menu = Menu.new
    dish_1 = Dish.new("pasta", 10)
    dish_2 = Dish.new("salad", 5)
    my_menu.add(dish_1)
    my_menu.add(dish_2)
    menu_formatter = MenuFormatter.new(my_menu, io)
    menu_formatter.show
  end

  it "adds the dishes to the menu and shows them in a nicely formatted list" do
    dish_1 = Dish.new("pasta", "10")
    dish_2 = Dish.new("salad", "5")
    my_menu = Menu.new
    my_menu.add(dish_1)
    my_menu.add(dish_2)
    io = double :io
    expect(io).to receive(:puts).with("pasta - 10.00")
    expect(io).to receive(:puts).with("salad - 5.00")
    my_menu.show(io)
  end

  it "adds selected dishes to the ordering list" do
    dish_1 = Dish.new("pasta", "10")
    dish_2 = Dish.new("salad", "5")
    my_menu = Menu.new
    my_menu.add(dish_1)
    my_menu.add(dish_2)
    dish_1.select
    my_order = Order.new(my_menu)
    expect(my_order.selected).to eq [dish_1]
  end

  it "calculates the total sum to pay and shows the receipt" do
    dish_1 = Dish.new("pasta", 10)
    dish_2 = Dish.new("salad", 5)
    my_menu = Menu.new
    my_menu.add(dish_1)
    my_menu.add(dish_2)
    dish_1.select
    dish_2.select
    io = double :io
    
    expect(io).to receive(:puts).with("please enter the quantity for #{dish_1}").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("please enter the quantity for #{dish_2}").ordered
    expect(io).to receive(:gets).and_return("3").ordered
    expect(io).to receive(:puts).with("pasta - 2").ordered
    expect(io).to receive(:puts).with("salad - 3").ordered
    expect(io).to receive(:puts).with("Total to pay: 35").ordered

    my_order = Order.new(my_menu, io)
    my_order.selected
    my_order.quantity
    my_order.total
    my_order.receipt
  end

  it "send a text message with estimated time of delivery" do
  end
end