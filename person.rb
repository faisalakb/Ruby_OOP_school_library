class Person
  attr_accessor :id, :name, :age, :rentals
  attr_reader :parent_permission
  
  def initialize(name, age, parent_permission: true)
    @id = object_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  
  def to_h
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'rentals' => @rentals.map { |rental| rental.to_h }
    }
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(book, date)
    rental = Rental.new(date, book, self)  # Create a rental and associate it with the person
    @rentals << rental  # Add the rental to the person's rentals
    rental  # Return the created rental
  end
end
