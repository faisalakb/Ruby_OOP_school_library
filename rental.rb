require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_h
    {
      'book' => {
      'date' => @date,
      'book' => @book.to_h,  # Correctly reference the book's to_h method
      'person' => @person.to_h
      },
      'person_id' => @person.object_id,
      'date' => @date
    }
  end
end
