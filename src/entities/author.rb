# frozen_string_literal: true

require_relative 'entity'

class Author < Entity
  attr_reader :name, :biography

  def initialize(name, biography = nil)
    super()
    @name = name
    @biography = biography
    validate_vars
  end

  def validate_vars
    type_check(name, String)
    not_empty_check(name)
  end
end
