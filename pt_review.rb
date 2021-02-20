


@pets =[
  {key:1, name: "Dog", price:10},
  {key:2, name: "Cat", price:30},
  {key:3, name: "Bird", price:20}
]


@options = [
  {key:1, name: "View Pets"},
  {key:2, name: "add Pet to cart"},
  {key:3, name: "View Cart"},
  {key:4, name: "Checkout"},
  {key:5, name: "Remove Item"},
  {key:6, name: "add pets to store"}
]

@cart =[]


def display_options
  @options.each_with_index do | option, index|
    puts " #{option[:key]}, #{option[:name]}"
  end
end

def view_pets
  @pets.each_with_index do | pet, index|
    puts "#{pet[:key]}, Type:#{pet[:name]}, $#{pet[:price]}"
  end
end

def add_pets
  basket = {}
  puts "What would you like to add?"
  view_pets
  selection = gets.chomp.to_i
  basket[:name] = @pets[selection -1][:name]
  basket[:price] = @pets[selection -1][:price]
  @cart << basket
  puts " You are getting #{basket}"

end

def adding_to_pets
  puts "What do you want the name to be?"
  new_name = gets.chomp
  puts "What do you want the price to be?"
  new_price = gets.chomp.to_i
  new_pet ={
    key: @pets.length + 1,
    name:new_name,
    price:new_price,
  }
  @pets << new_pet

end


def view_cart
  @cart.each_with_index do | item, index|
    puts "#{item[:name]}, #{item[:price]}"
  end
end


def checkout
  total = 0
  @cart.each do |item|
    total += item[:price].to_i
  end
  puts "the total is #{total}"
end



def remove_item
  puts " What would you like to remove?"
  delete_item = gets.chomp.to_i
  @cart.delete_at(delete_item -1)
  view_cart
end



def display_menu
  puts "What would you like to do?"
  display_options
  choice = gets.chomp.to_i

  case choice
  when 1
    view_pets
    display_menu
  when 2
    add_pets
    display_menu
  when 3
    view_cart
    display_menu
  when 4
    view_cart
    checkout
  when 5
    view_cart
    remove_item
    display_menu
  when 6
    adding_to_pets
    display_menu
  else
    puts"good bye"
  end

end

display_menu
