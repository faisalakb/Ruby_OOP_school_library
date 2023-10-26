require_relative 'person'
class Teacher < Person
  attr_accessor :rentals
  
  def initialize(name, age, specialization, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
    @rentals = []
  end

  def can_use_services?
    true
  end
end
