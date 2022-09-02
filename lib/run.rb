class ProgramMenu
  def initialize(io = Kernel)
    @io = io
  end

  def interactive_menu
    loop do
      print_options
      process(@io.gets.chomp)
    end
  end

  def print_options
    @io.puts "1. Show the menu"
    @io.puts "2. Input your order"
    @io.puts "3. Get the receipt"
    @io.puts "4. Get a confirmation via text"
    @io.puts "9. Exit"
  end

  def process(selection)
    case selection
      when "1"
        #show menu
      when "2"
        # order
      when "3"
        # receipt
      when "4"
        # text
      when "9"
        return
      else
        puts "I don't know what you meant, please try again"
    end
  end
end
