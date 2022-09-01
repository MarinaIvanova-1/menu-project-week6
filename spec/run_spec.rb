require 'run'

RSpec.describe ProgramMenu do
  it "prints the menu" do
    io = double :io
    menu = double :menu
    allow(io).to receive(:puts).with("1. Show the menu")
    expect(io).to receive(:puts).with("2. Input your order")
    expect(io).to receive(:puts).with("3. Get the receipt")
    expect(io).to receive(:puts).with("4. Get a confirmation via text")
    expect(io).to receive(:puts).with("9. Exit")
    new_order = ProgramMenu.new(menu, io)
    new_order.print_options
  end

  it "lets the user to choose the option from the program menu" do
    io = double :io
    menu = double :menu
    expect(io).to receive(:puts).with("1. Show the menu")
    expect(io).to receive(:puts).with("2. Input your order")
    expect(io).to receive(:puts).with("3. Get the receipt")
    expect(io).to receive(:puts).with("4. Get a confirmation via text")
    expect(io).to receive(:puts).with("9. Exit")
    allow(io).to receive(:gets).and_return("9")
    new_order = ProgramMenu.new(menu, io)
    new_order.interactive_menu
  end
end