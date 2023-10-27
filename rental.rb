require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date

    book.rentals << self if book.respond_to?(:rentals)
    person.rentals << self if person.respond_to?(:rentals)
  end

  def to_h
    {
      'book' => {
        'title' => @book.title,
        'author' => @book.author
      },
      'person_id' => @person.object_id,
      'date' => @date
    }
  end
end
