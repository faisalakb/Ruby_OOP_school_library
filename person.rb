class Person
  attr_accessor :name, :age, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
