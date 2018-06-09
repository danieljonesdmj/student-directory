def input_students
     puts "Please enter the names of the students"
     puts "To finish, just hit return twice"
     # create an empty array
     students = []
     # get the first name
     name = gets.strip.gsub(/\w+/, &:capitalize)
     # while name is not empty, repeat this code
     while !name.empty? do
      students << {name: name}
      # students << {name: name}
       puts "We now have #{students.count} students"
       # get another name from the user
       name = gets.strip.gsub(/\w+/, &:capitalize)
     end
     name = gets.strip
     # return array of students
     students
 end

def input_cohort(students)
  students.each do |student|
    puts "Please enter cohort for #{student[:name]}"
    cohort = gets.strip.gsub(/\w+/, &:capitalize)
      student[:cohort] = cohort
    end
end

 def student_information(students)
   students.each do |student|
     puts "Please enter information relating to the students: #{student[:name]}"
     puts "Enter country of birth:"
     country = gets.strip.gsub(/\w+/, &:capitalize)
     if country.empty?
       student[:country] = "Nothing Input"
     else
       student[:country] = country
     end

     puts "Enter height (cm):"
     height = gets.strip
     if height.empty?
       student[:height] = "Nothing Input"
     else
       student[:height] = height
     end

     puts "Enter hobbies:"
     hobbies = gets.strip.gsub(/\w+/, &:capitalize)
     if hobbies.empty?
       student[:hobbies] = "Nothing Input"
     else
       student[:hobbies] = hobbies
     end
   end
 end

 def print_header
   puts "The students of Villans Academy"
   puts "----------"
 end

def group_by_cohort(students)
  puts "These are the students in the May cohort:"
  students.select {|student| student[:cohort] == "May"}.each_with_index do |student, index|
    puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)".center(15)
  end
end

 def print_redo(students)
   count = 0
   while (count < 1)
     students.each_with_index do |student, index|
       puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)"
       puts "--------------------------".center(50)
       puts "Additional information:".center(50)
       puts "Country: #{student[:country]}".center(50)
       puts "Height: #{student[:height]}".center(50)
       puts "Hobbies: #{student[:hobbies]}\n".center(50)
       count += 1
     end
   end
 end

 def print_footer(students)
   puts "Overall, we have #{students.count} great students."
 end
 #nothing happens until we call the methods
students = input_students
input_cohort(students)
student_information(students)

print_header
group_by_cohort(students)
# print_redo(students)
print_footer(students)
