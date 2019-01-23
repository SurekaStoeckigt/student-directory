def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.chomp
  # while the name is not empty, repat this code
  while !name.empty? do
  # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
  #get another name from the usesr
    name = gets.chomp
  end
  #return the array of students
  students
end 
def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end
def print(students)
    students.each_with_index do |student, index|
        puts "#{index + 1}  #{student[:name]} #{student[:cohort]}"
    end 
end

#	by_cohort.each_with_index do |student, index| # print out above results with index

#		puts "#{index + 1}. - #{student[:name]} in #{student[:cohort]}"

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end 
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

# input_students 
# line 5: create an empty array to store future students
# Then ask for the name of the student and discard the return character