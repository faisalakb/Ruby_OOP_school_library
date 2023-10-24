class RentalManager
  def initialize
    @rentals = []
  end

  def create_rental(book, person, date)
    rental = Rental.new(book, person, date)
    @rentals << rental
    puts 'Rental created successfully.'
  end
end
