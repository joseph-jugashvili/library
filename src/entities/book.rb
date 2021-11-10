# frozen_string_literal: true

require_relative 'entity'
class Book < Entity
  attr_reader :title, :author

  def initialize(title, author)
    super()
    @title = title
    @author = author
    validate_vars
  end

  def ==(other)
    title == other.title && author == other.author
  end

  private

  def validate_vars
    type_check(title, String)
    not_empty_check(title)
    type_check(author, Author)
  end
end
