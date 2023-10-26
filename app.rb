require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'book_manager'
require_relative 'person_manager'
require_relative 'rental_manager'

class App
  def initialize(book_manager, person_manager, rental_manager)
    @book_manager = book_manager
    @person_manager = person_manager
    @rental_manager = rental_manager
  end

  def list_books
    puts 'List of Books:'
    @book_manager.books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    puts 'List of People:'
    @person_manager.people.each do |person|
      puts "#{person.name} (ID: #{person.id}, Class: #{person.class})"
    end
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
      age = get_user_input('Age: ').to_i
      parent_permission = get_user_input('Has parent permission? (y/n): ').casecmp('y').zero?
      @person_manager.create_student(name, age: age, parent_permission: parent_permission, classroom: 'Some Classroom')
      puts "#{name} created as a Student."
    when 2
      age = get_user_input('Age: ').to_i
      specialization = get_user_input('Specialization: ')
      @person_manager.create_teacher(name, age, specialization)
      puts "#{name} created as a Teacher."
    else
      puts 'Invalid choice'
    end
  end

  def create_book
    puts 'Enter book details:'
    title = get_user_input('Title: ')
    author = get_user_input('Author: ')

    @book_manager.create_book(title, author)
  end

  def create_rental
    puts 'Enter rental details:'
    book_number = select_book
    person_number = select_person
    date = get_user_input('Rental date (yyyy/mm/dd): ')

    if valid_selection?(book_number, @book_manager.books.length) &&
       valid_selection?(person_number, @person_manager.people.length)
      book = @book_manager.books[book_number]
      person = @person_manager.people[person_number]
      @rental_manager.create_rental(book, person, date)
    else
      puts 'Invalid book or person selection.'
    end
  end

  def select_book
    puts 'Select a book by number:'
    @book_manager.books.each_with_index do |book, index|
      puts "Book_Number:#{index}. #{book.title} by #{book.author}"
    end

    get_user_input('Enter the book number: ').to_i
  end

  def select_person
    puts 'Select a person by number:'
    @person_manager.people.each_with_index do |person, index|
      puts "Person_Number:#{index}. #{person.name} (ID: #{person.object_id}, Class: #{person.class})"
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

    person = @person_manager.people.find { |p| p.object_id == person_id }

    if person
      puts "Rentals for #{person.name} (ID: #{person.object_id}):"
      person.rentals.each { |rental| puts "#{rental.book.title} (Rented on #{rental.date})" }
    else
      puts 'Person not found.'
    end
  end
end
