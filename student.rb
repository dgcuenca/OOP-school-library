require './person'
require './classroom'

class Student < Person
  def initialize(id, age, classroom, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
    @classroom.add_student(self) unless @classroom.nil?
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
