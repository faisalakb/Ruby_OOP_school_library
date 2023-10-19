# main.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Example usage
person = Person.new(1, 20, name: 'Alice', parent_permission: true)
puts person.can_use_services?

student = Student.new(2, 16, 'Math Class', name: 'Bob', parent_permission: true)
puts student.play_hooky

teacher = Teacher.new(3, 30, 'History', name: 'Carol', parent_permission: false)
puts teacher.can_use_services?
