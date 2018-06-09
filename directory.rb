def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first names
  name = gets.chomp
  puts "Please enter the hobby of the students"
  sport = gets.chomp
  puts "Please enter students country of birth"
  country = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: sport, birthplace: country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    sport = gets.chomp
  end
  #  return the array of students
  students
end

def print_header
  puts "The students of Villiains Academy"
  puts "-------------"
end

def print(students)
  until students == ""
  students.each do |student|
    puts "#{student[:name]} - #{student[:cohort]} cohort - #{student[:hobby]} - #{student[:birthplace]}"
  end
  break
end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
