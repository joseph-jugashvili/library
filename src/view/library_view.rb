# frozen_string_literal: true

class LibraryView
  attr_reader :lib
  def initialize(lib)
    @lib = lib
  end

  def top_books_view
    lib.sort_top_books.map do |book|
      "Title: #{book.title}, author: #{book.author.name}"
    end.join('. ')
  end

  def top_readers_view
    lib.sort_top_readers.map { |reader| "Name: #{reader.name}" }.join('. ')
  end

  def top_books_readers_view
    "Top readers of the top books: #{lib.top_books_readers}"
  end

  def top_books
    "Top books: #{top_books_view}"
  end

  def top_readers
    "Top readers: #{top_readers_view}"
  end

  def top_book_readers
    "Top books readers: #{top_books_readers_view}"
  end
end
