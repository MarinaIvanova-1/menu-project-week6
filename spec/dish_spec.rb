require 'dish'

RSpec.describe Dish do
  it "returns the name of the dish and its price" do
    new_dish = Dish.new("pasta", 10.00)
    expect(new_dish.dish_name).to eq "pasta"
    expect(new_dish.price).to eq 10.00
  end

  it "adds the category to the dish" do
    io = double :io
    expect(io).to receive(:puts).with("pasta - 10.00, category: main")
    new_dish = Dish.new("pasta", 10.00)
    new_dish.category("main")
    new_dish.show(io)
  end
end