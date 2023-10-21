class Student
  attr_accessor :name
  attr_reader :classroom, :rentals

  def initialize(name)
    @name = name
    @classroom = nil
    @rentals = []
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
