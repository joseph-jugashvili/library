# frozen_string_literal: true

require_relative 'entity'

class Reader < Entity
  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    super()
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    validate_vars
  end

  private

  def validate_vars
    params = [name, email, city, street]
    params.each do |param|
      type_check(param, String)
      not_empty_check(param)
    end
    type_check(house, Integer)
    positive_check(house)
  end
end
