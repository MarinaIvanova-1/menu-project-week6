require 'order'

RSpec.describe Order do
  it "adds selected dishes to the ordering list" do
    dish_1 = double :dish, selected?: true
    dish_2 = double :dish, selected?: false
    menu = double :menu, list: [dish_1, dish_2]
    my_order = Order.new(menu)
    expect(my_order.selected).to eq [dish_1]
  end

  it "allows to add multiple quantities of any dishes" do
    dish_1 = double :dish, selected?: true
    dish_2 = double :dish, selected?: false
    menu = double :menu, list: [dish_1, dish_2]
    my_order = Order.new(menu)
    expect(my_order.selected).to eq [dish_1]
  end

  it "adds the desired quantities for every dish" do
    dish_1 = double :dish, selected?: true
    dish_2 = double :dish, selected?: true
    menu = double :menu, list: [dish_1, dish_2]
    io = double :io
    expect(io).to receive(:puts).with("please enter the quantity for #[Double :dish]")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("please enter the quantity for #[Double :dish]")
    expect(io).to receive(:gets).and_return("3")
    my_order = Order.new(menu, io)
    my_order.selected
    my_order.quantity
  end

  it "calculates the total sum to pay" do
    dish_1 = double :dish, price: 10, selected?: true
    dish_2 = double :dish, price: 5, selected?: true
    menu = double :menu, list: [dish_1, dish_2]
    io = double :io
    expect(io).to receive(:puts).with("please enter the quantity for #{dish_1}")
    expect(io).to receive(:gets).and_return("2")
    expect(io).to receive(:puts).with("please enter the quantity for #{dish_2}")
    expect(io).to receive(:gets).and_return("3")
    my_order = Order.new(menu, io)
    my_order.selected
    my_order.quantity
    expect(my_order.total).to eq 35
  end

  it "calculates the total sum to pay and shows the receipt" do
    dish_1 = double :dish, dish_name: "pasta", price: 10, selected?: true
    dish_2 = double :dish, dish_name: "salad", price: 5, selected?: true
    menu = double :menu, list: [dish_1, dish_2]
    io = double :io
    
    expect(io).to receive(:puts).with("please enter the quantity for #{dish_1}").ordered
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("please enter the quantity for #{dish_2}").ordered
    expect(io).to receive(:gets).and_return("3").ordered
    expect(io).to receive(:puts).with("pasta - 2").ordered
    expect(io).to receive(:puts).with("salad - 3").ordered
    expect(io).to receive(:puts).with("Total to pay: 35").ordered

    my_order = Order.new(menu, io)
    my_order.selected
    my_order.quantity
    my_order.total
    my_order.receipt
  end

  it "calculates required time to prepare an order" do
    dish_1 = double :dish, time: 20, selected?: true
    dish_2 = double :dish, time: 5, selected?: true
    menu = double :menu, list: [dish_1, dish_2]
    my_order = Order.new(menu)
    my_order.selected
    expect(my_order.time_to_prepare).to eq 20
  end

end