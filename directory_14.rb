@center = 100
@students = [] # an empty array accessible to all methods

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
    puts "Now we have #{@students.count} students".center(@center)
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
end

def add_students(name, cohort, country, hobby)
@students << {name: name, cohort: cohort.to_sym, country: country, hobby: hobby}
return @students
end 

def show_students
  print_header
  print_student_list
  print_footer
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
  puts "Overall, we have #{@students.count} great students".center(@center)
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
  name, cohort, country, hobby = line.chomp.split(',')
  add_students(name, cohort, country, hobby)
  end
  file.close
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}".center(@center)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist.".center(@center)
    exit # quit the program
  end
end

try_load_students
interactive_menu