# frozen_string_literal: true

require_relative 'library_requires'

class Library
  include Store
  attr_reader :authors, :books, :readers, :orders

  TOP_READERS_QUANTITY = 1
  TOP_BOOKS_QUANTITY = 1
  TOP_BOOK_READERS_QUANTITY = 3
  def initialize(file)
    data = load(file)
    @authors = [] || data.authors
    @books = [] || data.books
    @readers = [] || data.readers
    @orders = [] || data.orders
  end

  def add(entity)
    case entity
    when Author then @authors << entity
    when Book then @books << entity
    when Reader then @readers << entity
    when Order then @orders << entity
    else
      raise("Your data doesn't belong to accessible entities. You can add only Author, Book, Reader or Order")
    end
  end

  def sort_top_readers(_quantity = TOP_READERS_QUANTITY)
    collect_top_readers = @orders.uniq.group_by(&:reader).map { |reader, books| [reader, books.count] }
    sorted = collect_top_readers.sort_by { |_readers, books| -books }
  end

  def sort_top_books(_quantity = TOP_BOOKS_QUANTITY)
    collect_top_books = @orders.uniq.group_by(&:book).map { |reader, books| [reader, books.count] }
    sorted = collect_top_books.sort_by { |_readers, books| -books }
  end

  def sort_top_book_readers(_quantity = TOP_BOOK_READERS_QUANTITY)
    collect_top_book_readers = @orders.group_by(&:book).map { |reader, books| [reader, books.count] }
    sorted = collect_top_book_readers.sort_by { |_readers, books| -books }
  end
end
