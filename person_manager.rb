class PersonManager
  attr_reader :people

  def initialize
    @people = []
  end

  def create_student(name, options = {})
    age = options[:age] || 0
    parent_permission = options[:parent_permission] || false
    classroom = options[:classroom] || 'Unknown Classroom'

    person = Student.new(name, age, parent_permission, classroom)
    @people << person
    puts "#{person.name} created as a Student."
  end

  def create_teacher(name, age, specialization)
    person = Teacher.new(name, age, specialization)
    @people << person
    puts "#{person.name} created as a Teacher."
  end

  def list_people
    puts 'List of People:'
    @people.each { |person| puts "#{person.name} (#{person.class})" }
  end

  def save_people_to_json(file_name)
    File.open(file_name, 'w') do |file|
      data = @people.map(&:to_json)
      file.write(JSON.generate(data))
    end
  end

  def load_people_from_json(file_name)
    if File.exist?(file_name)
      data = JSON.parse(File.read(file_name))
      @people = data.map { |person_data| Person.from_json(person_data) }
    end
  end
  def from_json(data)
    person = new(data['name'])
    person.instance_variable_set(:@id, data['id'])
    
    # Directly access the 'rentals' array
    person.rentals = data['rentals'].map do |rental_data|
      Rental.from_json(rental_data, nil, person)
    end
    
    person
  end
  

end
