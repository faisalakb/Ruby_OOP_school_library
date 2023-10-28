require 'rspec'
require_relative '../student'
require_relative '../person'
require_relative '../class_room'

RSpec.describe Student do
  let(:classroom) { Classroom.new('Math Class') }
  let(:student) { Student.new('Alice', 16, classroom: classroom) }

  describe '#initialize' do
    it 'creates a Student object with the given attributes' do
      expect(student.name).to eq('Alice')
      expect(student.age).to eq(16)
      expect(student.classroom).to eq(classroom)
      expect(student.parent_permission).to be(true)
    end
  end

  describe '#classroom=' do
    it 'updates the classroom and adds the student to the classroom' do
      new_classroom = Classroom.new('History Class')
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the student' do
      expected_hash = {
        'class' => 'Student',
        'name' => 'Alice',
        'age' => 16,
        'parent_permission' => true,
        'classroom' => classroom
      }

      expect(student.to_h).to eq(expected_hash)
    end
  end
end
