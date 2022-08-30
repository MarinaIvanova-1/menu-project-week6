## 1. Describe the Problem

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.



Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Design the Class System

```
                                         ┌────────────────────────────────────┐
                                         │ Dishes                             │
                                         │                                    │
                                         │ - name                             │
                                         │ - price                            │
                                         │ - category                         │
                                         │ - load a file                      │
                                         │ - save to a file                   │
                                         └────────────────────────────────────┘
                                                           ▲
                                                           │
                                                           │ owns a list of
                                                           │
                                         ┌─────────────────┴──────────────────┐
┌────────────────────────┐               │                                    │
│ Program menu           │               │ Food and drinks menu               │
│                        │               │                                    │
│ - show options         ├──────────────►│  - add (dish)                      │
│                        │               │  - all                             │
│                        │               │  - format                          │
│                        │               │                                    │
│                        │               │                                    │
└────────────┬───────┬───┘               │                                    │
             │       │                   └─────────────────┬──────────────────┘
             │       │                                     │
             │       │                                     │
             │       │                                     │
             │       │                                     ▼
             │       │                   ┌────────────────────────────────────┐
             │       │                   │ Order                              │
             │       │                   │                                    │
             │       │                   │ - select the dishes and quantity   │
             │       └──────────────────►│ - calculate total                  │
             │                           │ - show the list of selected dishes │
             │                           │                                    │
             │                           └────────────────────────────────────┘
             │
             │
             │
             │                           ┌────────────────────────────────────┐
             │                           │ Notification                       │
             └──────────────────────────►│                                    │
                                         │ - add phone number                 │
                                         │ - send a text                      │
                                         │                                    │
                                         │                                    │
                                         └────────────────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby

class Menu
  def initialize
  end

  def show_options
    #shows available options, allows the user to select the one they need
  end
end


class FoodMenu
  def initialize
    # ...
  end

  def add(dish) # dish is an instance of Dish
    # Dish gets added to the food menu
    # Returns nothing
  end

  def all
    # Returns a list of dish objects
  end
  
  def format 
    # Returns a nicely formatted list of all dishes
  end
end

class Dish
  def initialize(dish, price) # dish and price are both strings
  end

  def category
    # category is a symbol, gets added to the dish
  end

end

class Ordering
  def initialize
  end

  def select
    #user inputs a number corresponding to a dish and quantity of each dish
    #outputs order number
  end

  def total
    #calculates the cost of all ordered items
  end

  def get_receipt(order_number) #order_number 
    #shows the list of ordered items with a total for all of them
  end
end

class Notification
  def initialize
  end
  
  def add_number(number) #number is an integer consisting of 10 digits and starting with 0
    #outputs nothing
  end

  def send_text
    #shows a confirmation and sends a text to the phone number with estimated delivery time
  end

end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
