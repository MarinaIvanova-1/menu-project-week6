def interactive_menu
  loop do
    print_options
    process(STDIN.gets.chomp)
  end
end

def print_options
  puts "1. Show the menu"
  puts "2. Input your order"
  puts "3. Get the receipt"
  puts "4. Get a confirmation via text"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      @menu.show
    when "2"
      # order.Input
    when "3"
      # receipt
    when "4"
      # text
    when "9"
      exit
    else
      puts "I don't know what you meant, please try again"
  end
end