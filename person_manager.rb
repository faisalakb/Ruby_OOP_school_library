class PersonManager
  attr_reader :people

  def initialize
    @people = []
  end

  def create_student(name, age = 0, parent_permission = true)
    person = Student.new(name, age, parent_permission)
    @people << person
    person
  end

  def create_teacher(name, age, specialization)
    person = Teacher.new(name, age, specialization)
    @people << person
    person
  end
end
