@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the name of the student"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Please enter the cohort of the student"
  cohort = gets.chomp
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
      name = gets.chomp
        unless name.empty?
        puts "Please enter the cohort of the student"
        cohort = gets.chomp
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
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
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
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
