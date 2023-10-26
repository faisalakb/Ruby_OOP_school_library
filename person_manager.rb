class PersonManager
  attr_reader :people

  def initialize
    @people = []
  end

  def create_student(name)
    person = Student.new(name)
    @people << person
    person
  end

  def create_teacher(name, age, specialization)
    person = Teacher.new(name, age, specialization)
    @people << person
    person
  end

  def save_people_to_json
    File.open('people.json', 'w') do |file|
      file.write(JSON.dump(@people.map do |person|
        if person.is_a?(Teacher)
          { 'name' => person.name, 'age' => person.age, 'specialization' => person.specialization }
        else
          { 'name' => person.name }
        end
      end))
    end
  end

  def load_people_from_json
    if File.exist?('people.json')
      @people = JSON.parse(File.read('people.json')).map do |person_data|
        if person_data['specialization']
          Teacher.new(person_data['name'], person_data['age'], person_data['specialization'])
        else
          Student.new(person_data['name'])
        end
      end
    end
  end
end
