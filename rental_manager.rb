class RentalManager
  def initialize
    @rentals = []
  end
  

  def create_rental(book, person, date)
    rental = Rental.new(book, person, date)
    @rentals << rental
    puts 'Rental created successfully.'
  end

  def save_rentals_to_json(file_name)
    File.open(file_name, 'w') do |file|
      data = @rentals.map(&:to_json)
      file.write(JSON.generate(data))
    end
  end

  def load_rentals_from_json(file_name)
    if File.exist?(file_name)
      data = JSON.parse(File.read(file_name))
      @rentals = data.map { |rental_data| Rental.from_json(rental_data) }
    end
  end

  def list_rentals_for_person(person)
    @rentals.select { |rental| rental.person == person }
  end
end
