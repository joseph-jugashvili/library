# frozen_string_literal: true

class SizeError < StandardError
  def initialize
    super('Variable is empty')
  end
end
