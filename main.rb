# main.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Example usage
person = Person.new(1, 20, 'Alice', true)
puts person.can_use_services?

student = Student.new(2, 16, 'Bob', true, 'Math Class')
puts student.play_hooky

teacher = Teacher.new(3, 30, 'Carol', false, 'History')
puts teacher.can_use_services?
