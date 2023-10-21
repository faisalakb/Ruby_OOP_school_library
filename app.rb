require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'class_room'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    puts 'List of People:'
    @people.each do |person|
      puts "#{person.name} (#{person.class})"
    end
  end

  def create_person
    puts 'Enter person details:'
    print 'Name: '
    name = gets.chomp

    puts 'Select person type:'
    puts '1. Student'
    puts '2. Teacher'
    print 'Enter the option (1/2): '
    choice = gets.chomp.to_i

    case choice
    when 1
      person = Student.new(name)
      @people << person
      puts "#{person.name} created as a Student."
    when 2
      print 'Age: '
      age = gets.chomp.to_i
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(name, age, specialization)
      @people << person
      puts "#{person.name} created as a Teacher."
    else
      puts 'Invalid choice'
    end
  end

  def create_book
    puts 'Enter book details:'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts "'#{book.title}' by #{book.author} created."
  end

  def create_rental
    puts 'Enter rental details:'

    puts 'Select a book by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    print 'Enter the book number: '
    book_number = gets.chomp.to_i

    puts 'Select a person by number:'
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        person_type = '[student]'
        person_info = "Name: #{person.name}, ID: #{person.object_id}"
      elsif person is_a?(Teacher)
        person_type = '[teacher]'
        person_info = "Name: #{person.name}, ID: #{person.object_id}, Age: #{person.age}"
      end
      puts "#{index}) #{person_type} #{person_info}"
    end
    print 'Enter the person number: '
    person_number = gets.chomp.to_i

    print 'Rental date (yyyy/mm/dd): '
    date = gets.chomp

    if book_number < 0 || book_number >= @books.length || person_number < 0 || person_number >= @people.length
      puts 'Invalid book or person selection.'
      return
    end

    book = @books[book_number]
    person = @people[person_number]

    rental = Rental.new(book, person, date)
    @rentals << rental
    puts 'Rental created successfully.'
  end

  def list_rentals_for_person
    puts "Enter person's ID to list rentals: "
    person_id = gets.chomp.to_i

    person = @people.find { |p| p.object_id == person_id }

    if person.nil?
      puts 'Person not found.'
      return
    end

    puts "Rentals for #{person.name} (ID: #{person.object_id}):"
    person.rentals.each do |rental|
      puts "#{rental.book.title} (Rented on #{rental.date})"
    end
  end

  def start
    puts "\n Welcome to school library App \n"
    loop do
      puts "\nPlease choose an option to enter a number:"
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List all rentals for a given person id'
      puts '7. Quit'
      print 'Enter the option (1-7): '
      option = gets.chomp.to_i

      case option
      when 1
        list_books
      when 2
        list_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals_for_person
      when 7
        puts 'Please come again. GoodBye!'
        return
      else
        puts 'Invalid option. Please choose a valid option.'
      end
    end
  end
end

app = App.new
app.start
