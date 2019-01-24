def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  name = gets.chomp
  # while the name is not empty, repat this code
  puts "Now enter the country of birth"
  country = gets.chomp
  puts "Now enter height"
  height = gets.chomp
  puts "Now enter a hobby"
  hobby = gets.chomp
  while !name.empty? do
  # add the student hash to the array
    students << {name: name, cohort: :november, country: country, height: height, hobby: hobby}
    puts "Now we have #{students.count} students"
  #get another name from the usesr
    name = gets.chomp
    puts "Now enter the country of birth"
    if !name.empty?
      country = gets.chomp
      puts "Now enter height"
      height = gets.chomp
      puts "Now enter a hobby"
      hobby = gets.chomp
    else
    end
  end
  #return the array of students
  students
end 
def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end
def print(students)
    index = 0
    while index < students.length do 
    #students.each_with_index do |student, index|
      puts "#{index + 1}  #{students[index][:name]} #{students[index][:cohort]}, #{students[index][:country]}"
      index = index + 1
    end 
end

def print_by_letter(students)
puts "Enter a letter: "
    letter = gets.chomp
    count = 0
    index = 0
  while index < students.length do 
  #students.each do |student|
    if students[index][:name].start_with?(letter.upcase, letter.downcase)
      puts "#{students[index][:name]} (#{students[index][:cohort]} cohort, #{students[index][:country]})"
      count = count + 1
    else
    end
    index = index + 1
  end
end

def print_by_length(students)
    puts "Enter a number: "
    num = gets.chomp.to_i
    index = 0
  while index < students.length do
  #students.each do |student|
    if students[index][:name].length <= num
      puts "#{students[index][:name]}"
    else
    end
    index = index + 1
  end  
end



def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end 
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_by_letter(students)
print_by_length(students)
print_footer(students)

# input_students 
# line 5: create an empty array to store future students
# Then ask for the name of the student and discard the return character