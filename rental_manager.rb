require 'json'
class RentalManager
  attr_reader :rentals
  def initialize
    @rentals = []
  end

  def create_rental(book, person, date)
    rental = Rental.new(book, person, date)
    @rentals << rental
    rental
  end
  def save_rentals_to_json
    File.open('rentals.json', 'w') do |file|
      file.write(JSON.dump(@rentals.map do |rental|
        { 'book_id' => rental.book.object_id, 'person_id' => rental.person.object_id, 'date' => rental.date }
      end))
    end
  end

  def load_rentals_from_json
    if File.exist?('rental.json')
      @rentals = JSON.parse(File.read('rental.json')).map do |rental_data|
        book = @book_manager.books.find { |book| book.object_id == rental_data['book_id'] }
        person = @person_manager.people.find { |person| person.object_id == rental_data['person_id'] }
        Rental.new(book, person, rental_data['date'])
      end
    end
  end
end
