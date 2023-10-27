require 'rspec'
require_relative '../book'
require_relative '../rental'

RSpec.describe Book do
  let(:book) { Book.new('Sample Book', 'Sample Author') }
  let(:person) { double('Person') }
  let(:rental_date) { '2023-10-27' }

  describe '#initialize' do
    it 'creates a new book with title and author' do
      expect(book.title).to eq('Sample Book')
      expect(book.author).to eq('Sample Author')
    end

    it 'initializes rentals as an empty array' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the book' do
      rental = book.add_rental(person, rental_date)
      allow(rental).to receive(:to_h).and_return('date' => rental_date) # Mock to_h method

      expected_hash = {
        'title' => 'Sample Book',
        'author' => 'Sample Author',
        'rentals' => [{ 'date' => rental_date }] # Correctly structure the expected hash
      }

      expect(book.to_h).to eq(expected_hash)
    end
  end
end
