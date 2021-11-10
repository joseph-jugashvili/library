# frozen_string_literal: true

class NumError < StandardError
  def initialize
    super('You should input positive num')
  end
end
