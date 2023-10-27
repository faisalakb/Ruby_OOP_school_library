require_relative 'person'
class Student < Person
  attr_accessor :classroom
  attr_reader :id

  @@next_id = 1

  def initialize(name, age = 0, parent_permission = false, classroom = 'Unknown Classroom')
    super(name)
    @age = age
    @parent_permission = parent_permission
    @classroom = classroom
    @id = @@next_id
    @@next_id += 1
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
