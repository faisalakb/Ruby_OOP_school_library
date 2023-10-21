class Teacher < Person
  def initialize(name, age, specialization, parent_permission: true)
    super(name)
    @age = age
    @specialization = specialization
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end
