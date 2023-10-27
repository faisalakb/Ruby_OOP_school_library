require 'rspec'
require_relative '../teacher'
require_relative '../person'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new('John', 35, 'Math') }

  describe '#initialize' do
    it 'creates a Teacher object with the given attributes' do
      expect(teacher.name).to eq('John')
      expect(teacher.age).to eq(35)
      expect(teacher.parent_permission).to be(true)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a teacher' do
      expect(teacher.can_use_services?).to be(true)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the teacher' do
      expected_hash = {
        'class' => 'Teacher',
        'name' => 'John',
        'age' => 35,
        'parent_permission' => true,
        'specialization' => 'Math'
      }

      expect(teacher.to_h).to eq(expected_hash)
    end
  end
end
