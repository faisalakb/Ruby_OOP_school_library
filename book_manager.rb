require 'json'

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

  def save_books_to_json(filename)
    File.open(filename, 'w') do |file|
      data = @books.map(&:to_h)
      file.write(JSON.generate(data))
    end
  end

  def load_books_from_json(filename)
    if File.exist?(filename)
      json_data = File.read(filename)
      @books = JSON.parse(json_data).map do |data|
        book = Book.new(data['title'], data['author'])
        book
      end
    else
      @books = []
    end
  end
end
