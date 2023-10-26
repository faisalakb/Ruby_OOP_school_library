require_relative 'app'

app = App.new
puts "\nWelcome to the School Library App\n"
at_exit { app.exit }
loop do
  puts "\nPlease choose an option by entering the number:"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person'
  puts '7. Quit'
  print 'Enter the option (1-7): '
  option = gets.chomp.to_i

  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals_for_person
  when 7
    puts 'Goodbye! Thank you for using the School Library App.'
    break
  else
    puts 'Invalid option. Please choose a valid option.'
  end
end
