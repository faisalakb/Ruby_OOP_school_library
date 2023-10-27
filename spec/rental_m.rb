require 'rspec'
require_relative '../person'
require_relative '../rental'
require_relative '../book'

RSpec.describe Rental do
  let(:book) { Book.new('Sample Book', 'Sample Author') }
  let(:person) { Person.new('Alice', 25) }
  let(:rental_date) { '2023-10-27' }
  let(:rental) { Rental.new(rental_date, book, person) }

  describe '#to_h' do
    it 'returns a hash representation of the rental' do
      book_hash = { 'title' => 'Sample Book', 'author' => 'Sample Author' }
      person_hash = {
        'id' => person.object_id,
        'name' => 'Alice',
        'age' => 25,
        'rentals' => []
      }
      expected_hash = {
        'book' => {
          'date' => rental_date,
          'book' => include(book_hash),
          'person' => include(person_hash)
        },
        'person_id' => person.object_id,
        'date' => rental_date
      }

      expect(rental.to_h).to include(expected_hash)
    end
  end
end
