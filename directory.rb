# Continue refactoring the code. Which method is a bit too long?
# What method names are not clear enough? Anything else you'd change to make your code look more elegant? Why?
# A: Made method to avoid repetition of code for pluralising/signularising word 'student'
# A: Moved around order of methods so grouped by printing methods, methods in the print menu, and methods that initialize the program

@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def print_header
  puts "\n-------------"
  puts "The students of Villains Academy:"
end

def print_students_list
  @students.sort_by! {|student| student[:cohort]}
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
    student_pluralisation
    puts "Overall, we  have #{@students.count} great #{@pluralsing}"
    puts "-------------"
    puts "\n"
end

def input_students
  puts "Please enter the name of the student"
  name = STDIN.gets.chomp
  puts "Please enter the cohort of the student"
  cohort = STDIN.gets.chomp
    if cohort == ""
      cohort = "default"
    else
    end
  # while the name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      @students << {name: name, cohort: cohort}
        student_pluralisation
        puts "Now we have #{@students.count} #{@pluralsing}"
      # get another name from the user
      puts "Please enter the name of the student"
      puts "(or hit return to finish)"
      name = STDIN.gets.chomp
        unless name.empty?
        puts "Please enter the cohort of the student"
        cohort = STDIN.gets.chomp
          if cohort == ""
            cohort = "default"
          else
          end
        end
    end
    user_feedback
end

def show_students
  print_header
  print_students_list
  print_footer
  user_feedback
end

def save_students
  require 'csv'
  user_choose_file
  # open the file for writing
  @file = CSV.open(@file, "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data
    @file.puts csv_line
  end
  @file.close
  user_feedback
end

def load_students
  user_choose_file
  @students = []
  @file = File.open(@file, "r")
  @file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
  end
 @file.close
  user_feedback
end

def try_load_students
  if ARGV.first
    @file = ARGV.first
  else
    @file = "students.csv"
  end
  if File.exists?(@file)
    load_students
    puts "Loaded #{@students.count} from #{@file}"
  else
    puts "Sorry, #{@file} doesn't exist."
    exit
  end
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
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def student_pluralisation
  if @students.count > 1
    @pluralsing = "students"
  else
    @pluralsing = "student"
  end
end

def user_feedback
  puts "Your action was successful!"
end

def user_choose_file
  puts "Which file?"
  @file = STDIN.gets.chomp
end

try_load_students
interactive_menu
