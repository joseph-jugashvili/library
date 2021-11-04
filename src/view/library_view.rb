class LibraryView
  def top_books_view(sort)
    sort.map do |book, count|
      "Title: #{book.title}, author: #{book.author.name}, times taken: #{count}"
    end.join('. ')
  end

  def top_readers_view(sort)
    sort.map { |reader, count| "Name: #{reader.name}, number of books: #{count}" }.join('. ')
  end

  def top_books_readers_view(sort)
    sort.map { |book, count| "Title: #{book.title}, readers count: #{count}" }.join('. ')
  end

  def top_books(sort)
    "Top books: #{top_books_view(sort)}"
  end

  def top_readers(sort)
    "Top readers: #{top_readers_view(sort)}"
  end

  def top_book_readers(sort)
    "Top books readers: #{top_books_readers_view(sort)}"
  end
end
