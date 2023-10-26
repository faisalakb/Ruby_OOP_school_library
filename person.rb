class Person
  attr_reader :id, :name, :age, :rentals

  def initialize(name, age = 0, parent_permission: true)
    @id = object_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  attr_writer :name

  attr_writer :age

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
