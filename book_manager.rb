require 'json'
class BookManager
  attr_reader :books

  def initialize
    @books = []
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    book
  end

  def save_books_to_json
    File.open('books.json', 'w') do |file|
      file.write(JSON.dump(@books.map { |book| { 'title' => book.title, 'author' => book.author } }))
    end
  end

  def load_books_from_json
    if File.exist?('books.json')
      @books = JSON.parse(File.read('books.json')).map do |book_data|
        Book.new(book_data['title'], book_data['author'])
      end
    end
  end
end
