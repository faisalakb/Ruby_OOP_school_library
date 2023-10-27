require 'json'

class PersonManager
  attr_reader :people

  def initialize
    @people = []
  end

  def create_student(name, age: 0, parent_permission: true, classroom: 'Unknown')
    person = Student.new(name, age, parent_permission: parent_permission, classroom: classroom)

    @people << person
    person
  end

  def create_teacher(name, age, specialization)
    person = Teacher.new(name, age, specialization)
    @people << person
    person
  end

  def save_people_to_json(filename)
    File.open(filename, 'w') do |file|
      file.puts JSON.generate(@people.map(&:to_h))
    end
  end

  def load_people_from_json(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      @people = JSON.parse(json_data).map do |data|
        if data['class'] == 'Student'
          Student.new(data['name'], data['age'],
                      parent_permission: data['parent_permission'],
                      classroom: data['classroom'])
        elsif data['class'] == 'Teacher'
          Teacher.new(data['name'], data['age'], data['specialization'], parent_permission: data['parent_permission'])
        end
      end
    else
      @people = [] # Initialize with an empty array if the file doesn't exist.
    end
  end
end
