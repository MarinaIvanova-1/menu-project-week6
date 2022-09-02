require 'run'

RSpec.describe ProgramMenu do
  it "shows options in the program menu" do
    io = double :io
    expect(io).to receive(:puts).with("1. Show the menu")
    expect(io).to receive(:puts).with("2. Input your order")
    expect(io).to receive(:puts).with("3. Get the receipt")
    expect(io).to receive(:puts).with("4. Get a confirmation via text")
    expect(io).to receive(:puts).with("9. Exit")
    new_user = ProgramMenu.new(io)
    new_user.print_options
  end
end