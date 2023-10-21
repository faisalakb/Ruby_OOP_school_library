require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'class_room'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'List of Books:'
    @books.each { |book| puts "#{book.title} by #{book.author}" }
  end

  def list_people
    puts 'List of People:'
    @people.each { |person| puts "#{person.name} (#{person.class})" }
  end

  def create_person
    puts 'Enter person details:'
    name = get_user_input('Name: ')

    puts 'Select person type:'
    puts '1. Student'
    puts '2. Teacher'
    choice = get_user_input('Enter the option (1/2): ').to_i

    case choice
    when 1
      create_student(name)
    when 2
      create_teacher(name)
    else
      puts 'Invalid choice'
    end
  end

  def create_student(name)
    person = Student.new(name)
    @people << person
    puts "#{person.name} created as a Student."
  end

  def create_teacher(name)
    age = get_user_input('Age: ').to_i
    specialization = get_user_input('Specialization: ')
    person = Teacher.new(name, age, specialization)
    @people << person
    puts "#{person.name} created as a Teacher."
  end

  def create_book
    puts 'Enter book details:'
    title = get_user_input('Title: ')
    author = get_user_input('Author: ')

    book = Book.new(title, author)
    @books << book
    puts "'#{book.title}' by #{book.author} created."
  end

  def create_rental
    puts 'Enter rental details:'
    book_number = select_book
    person_number = select_person
    date = get_user_input('Rental date (yyyy/mm/dd): ')

    if valid_selection?(book_number, @books.length) && valid_selection?(person_number, @people.length)
      book = @books[book_number]
      person = @people[person_number]
      rental = Rental.new(book, person, date)
      @rentals << rental
      puts 'Rental created successfully.'
    else
      puts 'Invalid book or person selection.'
    end
  end

  def select_book
    puts 'Select a book by number:'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    get_user_input('Enter the book number: ').to_i
  end

  def select_person
    puts 'Select a person by number:'
    @people.each_with_index do |person, index|
      person_type = person.is_a?(Student) ? '[student]' : '[teacher]'
      person_info = "Name: #{person.name}, ID: #{person.object_id}"
      puts "#{index}) #{person_type} #{person_info}"
    end
    get_user_input('Enter the person number: ').to_i
  end

  def valid_selection?(number, max)
    number >= 0 && number < max
  end

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end

  def list_rentals_for_person
    puts "Enter person's ID to list rentals: "
    person_id = get_user_input('').to_i

    person = @people.find { |p| p.object_id == person_id }

    if person
      puts "Rentals for #{person.name} (ID: #{person.object_id}):"
      person.rentals.each { |rental| puts "#{rental.book.title} (Rented on #{rental.date})" }
    else
      puts 'Person not found.'
    end
  end
end
