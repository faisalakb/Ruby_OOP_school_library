class PersonManager
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

  def list_people
    puts 'List of People:'
    @people.each { |person| puts "#{person.name} (#{person.class})" }
  end
end
