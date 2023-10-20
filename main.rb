require_relative 'class_room'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require_relative 'person'

classroom = Classroom.new('Math')
student1 = Student.new('Alice')
student2 = Student.new('Bob')

classroom.add_student(student1)
classroom.add_student(student2)

puts "#{student1.name} is in #{student1.classroom.label} classroom."
puts "#{student2.name} is in #{student2.classroom.label} classroom."

book1 = Book.new('Ruby Programming', 'John Smith')
book2 = Book.new('Python for Beginners', 'Jane Doe')

person1 = Person.new('Emma')
person2 = Person.new('Chris')

rental1 = Rental.new(book1, person1, '2023-10-20')
rental2 = Rental.new(book2, person2, '2023-10-21')

puts "#{person1.name} has rented '#{rental1.book.title}' on #{rental1.date}."
puts "#{person2.name} has rented '#{rental2.book.title}' on #{rental2.date}."
