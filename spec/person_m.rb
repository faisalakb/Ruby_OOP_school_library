require 'rspec'
require_relative '../person' # Adjust the path to match your project structure
require_relative '../rental'

RSpec.describe Person do
  let(:person) { Person.new('Alice', 20) }

  it 'should initialize a Person object with the given attributes' do
    expect(person.name).to eq('Alice')
    expect(person.age).to eq(20)
    expect(person.instance_variable_get(:@parent_permission)).to eq(true)
    expect(person.rentals).to be_empty
  end

  it 'should return true if the person is 18 years or older' do
    expect(person.of_age?).to be(true)
  end

  it 'should return false if the person is under 18 years old' do
    under_age_person = Person.new('Bob', 17)
    expect(under_age_person.of_age?).to be(false)
  end

  it 'should return true if the person can use services' do
    expect(person.can_use_services?).to be(true)
  end

  it 'should return false if the person is under 18 and has no parent permission' do
    no_permission_person = Person.new('Fiona', 16, parent_permission: false)
    expect(no_permission_person.can_use_services?).to be(false)
  end

  it 'should add a rental to the person' do
    book = double('Book', title: 'Harry Potter', author: 'J.K. Rowling')
    rental = person.add_rental(book, '2023-10-27')
    expect(person.rentals).to include(rental)
  end
end
