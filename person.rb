require_relative 'nameable'
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name)
    @id = id
    @age = age
    @name = name
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
