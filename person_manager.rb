class PersonManager
  attr_reader :people

  def initialize
    @people = []
  end

  def create_student(name)
    person = Student.new(name)
    @people << person
    puts "#{person.name} created as a Student."
  end

  def create_teacher(name, age, specialization)
    person = Teacher.new(name, age, specialization)
    @people << person
    puts "#{person.name} created as a Teacher."
  end
end