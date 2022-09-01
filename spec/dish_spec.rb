require 'dish'

RSpec.describe Dish do
  it "shows the name, price and time it takes to prepare a dish" do
    dish_1 = Dish.new("pasta", "10", "15")
    expect(dish_1.dish_name).to eq "pasta"
    expect(dish_1.price).to eq "10"
    expect(dish_1.time).to eq "15"
  end

  it "allows to select the dishes" do
    dish_1 = Dish.new("pasta", "10")
    dish_2 = Dish.new("salad", "5")
    dish_1.select
    expect(dish_1.selected?).to be_truthy
    expect(dish_2.selected?).to be_falsy
  end

end