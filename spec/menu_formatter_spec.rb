require 'menu_formatter'

RSpec.describe MenuFormatter do
  it "shows the menu in a nice looking way" do
    io = double :io
    dish_1 = double :dish, dish_name: "pasta"
    menu = double :menu
    expect(io).to receive(:puts).with("pasta")
    menu_formatter = MenuFormatter.new(menu, io)
    expect(menu_formatter.show).to eq "pasta"
  end
end





# require 'menu_formatter'

# RSpec.describe MenuFormatter do
#   xit "adds the dishes to the menu and shows them in a list" do
#     io = double :io
#     expect(io).to receive(:puts).with("pasta - 10.00")
#     expect(io).to receive(:puts).with("salad - 5.00")
#     dish_1 = double :dish, dish_name: "pasta", price: 10.00
#     dish_2 = double :dish, dish_name: "salad", price: 5.00
#     menu = double :menu, list: [dish_1, dish_2]

#     formatter = MenuFormatter.new(menu)
#     formatter.show
#   end
# end