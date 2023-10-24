class BookManager
    attr_reader :books
  
    def initialize
      @books = []
    end
  
    def create_book(title, author)
      book = Book.new(title, author)
      @books << book
      puts "'#{book.title}' by #{book.author} created."
    end
  
    def list_books
      puts 'List of Books:'
      @books.each { |book| puts "#{book.title} by #{book.author}" }
    end
  end
  