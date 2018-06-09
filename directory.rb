@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.strip.gsub(/\w+/, &:capitalize)
  # while name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter student's cohort"
    cohort = STDIN.gets.strip.gsub(/\w+/, &:capitalize)
    # @students << {name: name, cohort: :november}
    # students << {name: name}
    puts "We now have #{@students.count+1} students"
    add_to_students(name, cohort)
    # get another name from the user
    name = STDIN.gets.strip.gsub(/\w+/, &:capitalize)
  end
end

# def input_cohort
#   @students.each do |student|
#   puts "Please enter cohort for #{student[:name]}"
#   cohort = gets.strip.gsub(/\w+/, &:capitalize)
#   student[:cohort] = cohort
#   end
# end

# def student_information
#  @students.each do |student|
#  puts "Please enter information relating to the students: #{student[:name]}"
#  puts "Enter country of birth:"
#  country = gets.strip.gsub(/\w+/, &:capitalize)
#   if country.empty?
#    student[:country] = "Nothing Input"
#   else
#    student[:country] = country
#   end
#   puts "Enter height (cm):"
#   height = gets.strip
#   if height.empty?
#    student[:height] = "Nothing Input"
#   else
#    student[:height] = height
#   end
#   puts "Enter hobbies:"
#   hobbies = gets.strip.gsub(/\w+/, &:capitalize)
#    if hobbies.empty?
#     student[:hobbies] = "Nothing Input"
#    else
#     student[:hobbies] = hobbies
#    end
#  end
# end

def print_header
 puts "The students of Villans Academy"
 puts "----------"
end

# def group_by_cohort
#   puts "These are the students in the May cohort:"
#   @students.select {|student| student[:cohort] == "May"}.each_with_index do |student, index|
#   puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)".center(15)
# end
# end

def print_redo
 count = 0
 while (count < 1)
   student_count = @students.count
   if student_count == 0
     puts "Nothing entered"
   else
   @students.each_with_index do |student, index|
   puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)"
   # puts "--------------------------".center(50)
   # puts "Additional information:".center(50)
   # puts "Country: #{student[:country]}".center(50)
   # puts "Height: #{student[:height]}".center(50)
   # puts "Hobbies: #{student[:hobbies]}\n".center(50)
   count += 1
   end
  end
 break
end
end

def print_footer
 # count = @students.count
 #  if count == 1
 #    puts "Overall, we have #{count} great student"
 #  elsif count == 0
 #    puts ""
 #  else count > 1
    puts "Overall, we have #{@students.count} great students"
# end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
    end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_redo
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9" # this will cause the program to terminate
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_to_students(name, cohort)
    # @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command csv_line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def add_to_students(name, cohort)
  @students << {name: name, cohort: cohort}
end
#nothing happens until we call the methods
# @students = input_students
# input_cohort(students)
# student_information(students)
try_load_students
interactive_menu
# print_header
# # group_by_cohort(students)
# print_redo
# print_footer
