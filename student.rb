class Student
  attr_accessor :name
  attr_reader :classroom

  def initialize(name)
    @name = name
    @classroom = nil
  end

  def classroom=(classroom)
    return if @classroom == classroom

    @classroom&.students&.delete(self)

    @classroom = classroom
    classroom&.add_student(self)
  end
end
