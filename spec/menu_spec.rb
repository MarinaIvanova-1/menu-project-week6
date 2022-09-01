require 'menu'

RSpec.describe Menu do
  it "shows an empty list if there are no dishes in the list" do
    my_menu = Menu.new
    expect(my_menu.list).to eq []
  end 

  it "adds the dishes to the menu and shows them in a list" do
    my_menu = Menu.new
    dish_1 = double :dish
    dish_2 = double :dish
    my_menu.add(dish_1)
    my_menu.add(dish_2)
    expect(my_menu.list).to eq [dish_1, dish_2]
  end

  it "adds the dishes to the menu and shows them in a list" do
    io = double :io
    dish_1 = double :dish, dish_name: "pasta", price: 10.00
    dish_2 = double :dish, dish_name: "salad", price: 5.00
    expect(io).to receive(:puts).with("pasta - 10.00")
    expect(io).to receive(:puts).with("salad - 5.00")
    my_menu = Menu.new
    my_menu.add(dish_1)
    my_menu.add(dish_2)
    my_menu.show(io)
  end
end
