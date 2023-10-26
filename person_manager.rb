class PersonManager
  attr_reader :people

  def initialize
    @people = []
  end

  def create_student(name, age: 0, parent_permission: true, classroom: 'Unknown')
    person = Student.new(name, age: age, parent_permission: parent_permission, classroom: classroom)
    @people << person
    person
  end

  def create_teacher(name, age, specialization)
    person = Teacher.new(name, age, specialization)
    @people << person
    person
  end
end
