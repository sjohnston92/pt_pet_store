

@animals = [
  {key: 1 name:'cat', age: 10},
  {key: 2 name: 'dog',age: 10},
  {key: 3 name: 'bird',age: 10}
]

def display_animals
  @animals.each_with_index do | animal, index|
    puts "Name #{animal[:name]} Age #{animal[:age]}"
  end

end


def add_animal(name, age)
  animal = {
    name: "#{name}",
    age:  "#{age}",
  }
  @animals << animal
end

def delete_animal
  display_animals
  puts " What aninmal would you like to delete?"
  index = gets.chomp.to_i

  puts "Are you sure?"
  del_answer = gets.chomp
   if del_answer == "y"
    puts "delete #{index}"
    @animals.delete_at(index)
   else del_answer
      menu_promp
   end

end



def edit_name(index)
  puts 'What name do you want to change?'
  new_name = gets.chomp   #1
  @animals[index + 1][:name]=new_name
end




def edit_animal
  display_animals
  puts " What aninmal name would you like to change?"
  index = gets.chomp.to_i
      edit_name(index)
end




def menu_promp
  puts " Start What would you like to do?"
  answer = gets.chomp.to_i
  case answer
  when 1
    puts "Whats the animals Name"
    name = gets.chomp
    puts "Whats the animals Age"
    age = gets.chomp.to_i
    add_animal(name,age)
    menu_promp
  when 2
    display_animals
    menu_promp
  when 3
    edit_animal
    menu_promp
  when 4
    delete_animal
    menu_promp
  end


end



def menu_items
  menu_promp

end

menu_items