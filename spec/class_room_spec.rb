require 'rspec'
require_relative '../class_room'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('Math Class') }
  let(:student) { double('Student') }

  describe '#initialize' do
    it 'creates a Classroom object with the given label' do
      expect(classroom.label).to eq('Math Class')
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      expect(student).to receive(:classroom=).with(classroom)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
