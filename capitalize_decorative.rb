require_relative 'base_decorative'

class CapitalizeDecorator < Decorator
  def correct_name
    name = @nameable.correct_name
    name.capitalize
  end
end
