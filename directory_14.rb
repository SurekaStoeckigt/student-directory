@center = 100
@students = [] # an empty array accessible to all methods
@loaded_file = ""
@default_file = "students.csv"

def add_cohort
cohort_arr = { 1 => :January, 2 => :February, 3 => :March, 4=> :April,
            5 => :May, 6 => :June, 7 => :July, 8 => :August,
            9 => :September, 10 => :October, 11 => :November, 12 => :December}
            puts "Enter the number of the month of cohort that you would like to join (1: January - 12: December)".center(@center)
            num = STDIN.gets.chomp.to_i
            if cohort_arr.has_key?num
            cohort = cohort_arr[num]
            else 
            cohort = cohort_arr[12]
            end
            cohort 

end

def num_students(num)
  if num == 1 then puts "Now we have #{num} great student" else puts "Now we have #{num} great students" end
end

def overall_students(num)
  if num == 1 then puts "Overall, we have #{num} great student" else puts "Overall, we have #{num} great students" end
end

def print_menu
  puts "1. Input the students".center(@center)
  puts "2. Show the students".center(@center)
  puts "3. Save the list to students.csv".center(@center)
  puts "4. Load the list from students.csv".center(@center)
  puts "9. Exit".center(@center) # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again".center(@center)
  end
end

def input_students
  puts "Please enter the names of the students".center(@center)
  puts "To finish, just hit return twice".center(@center)
  # get the first name
  name = STDIN.gets.chomp
  if !name.empty?
      cohort = add_cohort
      puts "Enter the country that #{name} was born in: ".center(@center)
      country = STDIN.gets.chomp
      puts "Enter #{name}'s first listed hobby: ".center(@center)
      hobby = STDIN.gets.chomp
  else
  end
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    #students << {name: name, cohort: :november}
    add_students(name, cohort, country, hobby)
    #puts "Now we have #{@students.count} students".center(@center)
    num_students(@students.count)
    # get another name from the user
    name = STDIN.gets.chomp
    if !name.empty? 
      cohort = add_cohort
      puts "Enter the country that #{name} was born in: ".center(@center)
      country = STDIN.gets.chomp
      puts "Enter #{name}'s first listed hobby: ".center(@center)
      hobby = STDIN.gets.chomp
    else
    end
  end
  puts "Input students successful."
end

def add_students(name, cohort, country, hobby)
@students << {name: name, cohort: cohort.to_sym, country: country, hobby: hobby}
return @students
end 

def show_students
  print_header
  print_student_list
  print_footer
  puts "Show students successful."
end

def print_header
  puts "The students of Villains Academy".center(@center)
  puts "-------------".center(@center)
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(@center)
  end
end

def print_footer
  overall_students(@students.count)
  #puts "Overall, we have #{@students.count} great students".center(@center)
end

def save_students
  # open the file for writing
  puts "Enter filename to save students to : "
  filename = STDIN.gets.chomp
  #file = File.open(filename, "w")
  # iterate over the array of students
  File.open(filename, "w") do |file| 
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  end
  puts "Save students successful."
end

def load_students(filename = @default_file)
  puts "Enter filename to load students from: "
  filename = STDIN.gets.chomp
  File.open(filename, "r") do |file|
  file.readlines.each do |line|
  name, cohort, country, hobby = line.chomp.split(',')
  add_students(name, cohort, country, hobby)
  end
  end
  puts "Load students successful."
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  if filename.nil? # get out of the method if it isn't given
  filename = @default_file
  puts "Loaded default file: #{filename}."
  elsif File.exists?(filename) # if it exists
    filename = @loaded_file
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist.".center(@center)
    exit # quit the program
  end
  load_students(filename)
  puts "Loaded #{@students.count} students from #{filename}".center(@center)
  
end

try_load_students
interactive_menu