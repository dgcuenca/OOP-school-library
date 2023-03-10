require './person'
require './classroom'

class Student < Person
  def initialize(age, name, parent_permission)
    super(age, name, parent_permission)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
