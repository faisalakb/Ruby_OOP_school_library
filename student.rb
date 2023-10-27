class Student < Person
  attr_accessor :name
  attr_reader :classroom, :rentals

  def initialize(name, age, parent_permission: true, classroom: 'Unknown')
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_h
    {
      'class' => 'Student',
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom
    }
  end
end
