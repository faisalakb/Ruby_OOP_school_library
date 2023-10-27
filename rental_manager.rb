require 'json'

class RentalManager
  def initialize
    @rentals = []
    @people = []
  end

  def create_rental(book, person, date)
    rental = Rental.new(book, person, date)
    @rentals << rental
    puts 'Rental created successfully.'
  end

  def save_rentals_to_json(filename)
    File.open(filename, 'w') do |file|
      file.puts JSON.generate(@rentals.map(&:to_h))
    end
  end

  def load_rentals_from_json(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      data = JSON.parse(json_data)

      @rentals = data.map do |rental_data|
        book_data = rental_data['book']
        book = Book.new(book_data['title'], book_data['author'])

        person_id = rental_data['person_id']
        person = @people.find { |p| p.object_id == person_id }

        date = rental_data['date']

        Rental.new(book, person, date)
      end
    else
      @rentals = []
    end
  end
end
