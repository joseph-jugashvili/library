# frozen_string_literal: true

require_relative 'entity'

class Order < Entity
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    super()
    @book = book
    @reader = reader
    @date = date
    validate_vars
  end

  private

  def validate_vars
    type_check(book, Book)
    type_check(reader, Reader)
    type_check(date, Date)
  end
end
