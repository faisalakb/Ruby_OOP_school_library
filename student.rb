# Represents a student in a classroom.
class Student < Person
  def initialize(id, age, classroom, name: 'Unknown', parent_permission: true)
    super(id, age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
