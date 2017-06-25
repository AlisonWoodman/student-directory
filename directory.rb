# let's put all students into hashes
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

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
      students << {name: name, cohort: cohort}
      if students.count > 1
        puts "Now we have #{students.count} students"
      else
        puts "Now we have #{students.count} student"
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
      # return the array of students
  return students
end

def print_header
  puts "\n-------------"
  puts "The students of Villains Academy:"
end

def print(students)
  students.sort_by! {|student| student[:cohort]}
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we  have #{names.count} great students"
  else
    puts "Overall, we  have #{names.count} great student"
  end
    puts "-------------"
    puts "\n"
end

def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
