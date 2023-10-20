class Person
  attr_accessor :name
  attr_reader :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end
end
