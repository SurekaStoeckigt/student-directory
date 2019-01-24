@center = 100
def add_cohort
cohort_arr = { 1 => :January, 2 => :February, 3 => :March, 4=> :April,
            5 => :May, 6 => :June, 7 => :July, 8 => :August,
            9 => :September, 10 => :October, 11 => :November, 12 => :December}
            puts "Enter number of the month of the cohort to join: ".center(@center)
            num = gets.chomp.to_i
            if cohort_arr.has_key?num
            cohort = cohort_arr[num]
            else 
            cohort = cohort_arr[12]
            end
            cohort 

end

def input_students
  puts "Please enter the names of the students".center(@center)
  puts "To finish, just hit return twice".center(@center)
  #create an empty array
  students = []
  name = gets.chomp
  # while the name is not empty, repat this code
  puts "Now enter the country of birth".center(@center)
  country = gets.chomp
  puts "Now enter height".center(@center)
  height = gets.chomp
  puts "Now enter a hobby".center(@center)
  hobby = gets.chomp
  cohort = add_cohort
  while !name.empty? do
  # add the student hash to the array
    students << {name: name, cohort: cohort, country: country, height: height, hobby: hobby}
    puts "Now we have #{students.count} students".center(@center)
  #get another name from the usesr
    name = gets.chomp
    if !name.empty?
      puts "Now enter the country of birth".center(@center)
      country = gets.chomp
      puts "Now enter height".center(@center)
      height = gets.chomp
      puts "Now enter a hobby".center(@center)
      hobby = gets.chomp
      cohort = add_cohort
    else
    end
  end
  #return the array of students
  students
end 
def print_header
  puts "The students of Villains Academy".center(@center)
  puts "---------------".center(@center)
end
def print(students)
    index = 0
    while index < students.length do 
    #students.each_with_index do |student, index|
      puts "#{index + 1}  #{students[index][:name]} #{students[index][:cohort]}, #{students[index][:country]}".center(@center)
      index = index + 1
    end 
end

def print_by_letter(students)
puts "Enter a letter: ".center(@center)
    letter = gets.chomp
    count = 0
    index = 0
  while index < students.length do 
  #students.each do |student|
    if students[index][:name].start_with?(letter.upcase, letter.downcase)
      puts "#{students[index][:name]} (#{students[index][:cohort]} cohort, #{students[index][:country]})".center(@center)
      count = count + 1
    else
    end
    index = index + 1
  end
end

def print_by_length(students)
    puts "Enter a number: ".center(@center)
    num = gets.chomp.to_i
    index = 0
  while index < students.length do
  #students.each do |student|
    if students[index][:name].length <= num
      puts "#{students[index][:name]}".center(@center)
    else
    end
    index = index + 1
  end  
end




def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(@center)
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

