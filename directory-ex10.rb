# We've been using the chomp() method to get rid of the last return character.
# Find another method among those provided by the String class that could be used
# for the same purpose (although it will require passing some arguments).
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
  name = gets.chop
  puts "Please enter the cohort of the student"
  cohort = gets.chop

  if cohort == ""
    cohort = "default"
  else
  end

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter the name of the student"
    puts "(or hit return to finish)"
    name = gets.chop
    unless name.empty?
    puts "Please enter the cohort of the student"
    cohort = gets.chop

    if cohort == ""
      cohort = "default"
    else
    end

    end
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts students
  #students.sort_by! {|student| student[:cohort]}
  #students.each do |student|
  #  puts "#{student[:name]} (#{student[:cohort]} cohort)"
#  end
end

def print_footer(names)
  unless names.count == 1
  puts "Overall, we have #{names.count} great students"
else
  puts "Overall, we have #{names.count} great student"
end
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
