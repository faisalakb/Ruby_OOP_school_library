require 'json'
require 'securerandom'
class Book
  attr_reader :id, :title, :author, :rentals

  def initialize(title, author)
    @id = SecureRandom.uuid
    @title = title
    @author = author
    @rentals = []
  end

  def to_json
    {
      id: @id,
      title: @title,
      author: @author
    }.to_json
  end

  def self.from_json(data)
    book = new(data['title'], data['author'])
    book.instance_variable_set(:@id, data['id'])
    book
  end
end

