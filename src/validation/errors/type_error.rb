# frozen_string_literal: true

class TypeError < StandardError
  def initialize
    super('You should input correct type of variable')
  end
end
