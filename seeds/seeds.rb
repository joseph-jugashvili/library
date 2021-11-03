# frozen_string_literal: true

require_relative '../src/library'

lib = Library.new('new_lib.yaml')

author = Author.new('Oleksa Kim', 'Student of KPI')
author1 = Author.new('Semen', 'Gamer')
author2 = Author.new('Ingvar', 'Bodybuilder')

lib.add(author)
lib.add(author1)
lib.add(author2)

book = Book.new('Biography of Stepan Bandera', author)
book1 = Book.new('How to get baned cause of ur name', author1)
book2 = Book.new('How to pump your muscles in Rome(Spain)', author2)

lib.add(book)
lib.add(book1)
lib.add(book2)

reader = Reader.new(name: 'Mykola', email: 'mykola@rubygarage.org', city: 'Kyiv', street: 'Jangelya', house: 20)
reader2 = Reader.new(name: 'Nazar', email: 'nazar@gmail.com', city: 'Sarny', street: 'Lenina', house: 35)

lib.add(reader)
lib.add(reader2)

order = Order.new(book1, reader)
order2 = Order.new(book2, reader)
order3 = Order.new(book, reader2)

lib.add(order)
lib.add(order2)
lib.add(order3)

lib.save('new_lib.yaml')

library_view = LibraryView.new()
puts library_view.top_books(lib.sort_top_books)
puts library_view.top_readers(lib.sort_top_readers)
puts library_view.top_book_readers(lib.sort_top_book_readers)

