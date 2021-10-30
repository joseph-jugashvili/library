# frozen_string_literal: true

require 'date'
require 'yaml'
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

  def sort_top_readers(quantity = TOP_READERS_QUANTITY)
    collect_top_readers = @orders.uniq.group_by(&:reader).map { |reader, books| [reader, books.count] }
    sorted = collect_top_readers.sort_by { |_readers, books| -books }
    sorted.first(quantity).map { |reader, count| "Name: #{reader.name}, number of books: #{count}" }.join('. ')
  end

  def sort_top_books(quantity = TOP_BOOKS_QUANTITY)
    collect_top_books = @orders.uniq.group_by(&:book).map { |reader, books| [reader, books.count] }
    sorted = collect_top_books.sort_by { |_readers, books| -books }
    sorted.first(quantity).map do |book, count|
      "Title: #{book.title}, author: #{book.author.name}, times taken: #{count}"
    end.join('. ')
  end

  def sort_top_book_readers(quantity = TOP_BOOK_READERS_QUANTITY)
    collect_top_book_readers = @orders.group_by(&:book).map { |reader, books| [reader, books.count] }
    sorted = collect_top_book_readers.sort_by { |_readers, books| -books }
    sorted.first(quantity).map { |book, count| "Title: #{book.title}, readers count: #{count}" }.join('. ')
  end

  def top_readers
    "Top readers: #{sort_top_readers}"
  end

  def top_books
    "Top books: #{sort_top_books}"
  end

  def top_book_readers
    "Top books readers: #{sort_top_book_readers}"
  end
end
