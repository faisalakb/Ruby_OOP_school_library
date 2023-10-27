require 'json'

class Person
  attr_accessor :name, :rentals
  attr_reader :id

  @@next_id = 1

  def initialize(name)
    @name = name
    @rentals = []
    @id = @@next_id
    @@next_id += 1
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end

  def to_json
    {
      name: @name,
      rentals: @rentals.map(&:to_json)
    }.to_json
  end
  

  def self.from_json(data)
    person_data = JSON.parse(data)
    person = new(person_data['name'])
    person.instance_variable_set(:@id, person_data['id'])
    
    # Directly access the 'rentals' array
    person.rentals = person_data['rentals'].map do |rental_data|
      Rental.from_json(rental_data, nil, person)
    end
    
    person
  end
  
   
end
