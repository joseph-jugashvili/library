# frozen_string_literal: true

require_relative 'require'

module Validation
  def type_check(var, type)
    raise TypeError unless var.is_a? type
  end

  def positive_check(var)
    raise NumError if var.negative?
  end

  def not_empty_check(var)
    raise SizeError if var.empty?
  end
end
