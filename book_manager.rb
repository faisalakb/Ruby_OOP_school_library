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

  def save_books_to_json(file_name)
    File.open(file_name, 'w') do |file|
      data = @books.map(&:to_json)
      file.write(JSON.generate(data))
    end
  end

  def load_books_from_json(file_name)
    if File.exist?(file_name)
      data = JSON.parse(File.read(file_name))
      @books = data.map { |book_data| Book.from_json(book_data) }
    end
  end
end
