class Teacher < Person
  attr_accessor :specialization, :parent_permission
  attr_reader :id

  @@next_id = 1

  def initialize(name, age = 0, specialization = 'Unknown Specialization', parent_permission = true)
    super(name)
    @age = age
    @specialization = specialization
    @parent_permission = parent_permission
    @id = @@next_id
    @@next_id += 1
  end

  def can_use_services?
    true
  end
end
