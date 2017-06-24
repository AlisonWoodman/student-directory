# 11. find all typos in that file and correct them.

def input_students
  students = []
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp

  while !name.empty? do
  students << {name: name, cohort: "november"}
  puts "Now we have #{students.count} students"
  name = gets.chomp
  end
  return students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(students)
  unless students.count == 1
  puts "Overall, we have #{students.count} great students"
else
  puts "Overall, we have #{students.count} great student"
end
end

students = input_students
print_header
print(students)
print_footer(students)
