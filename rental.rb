class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
  end

  def to_json
    {
      date: @date,
      book: @book.to_json,
      person_id: @person.id
    }.to_json
  end

  def self.from_json(data, book_manager, person)
    # Deserialize the book object from JSON
    book_data = JSON.parse(data['book'])
    book = book_manager.books.find { |b| b.id == book_data['id'] }
    
    self.new(book, person, data['date'])
  end
end
