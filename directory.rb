@students = [] # an empty array accessible to all methods

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
      if @students.count > 1
        puts "Now we have #{@students.count} students"
      else
        puts "Now we have #{@students.count} student"
      end
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
  if @students.count > 1
    puts "Overall, we  have #{@students.count} great students"
  else
    puts "Overall, we  have #{@students.count} great student"
  end
    puts "-------------"
    puts "\n"
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
  print_students_list
  print_footer
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
      @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
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

try_load_students
interactive_menu
