require './nameable'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name , parent_permission)
    super()
    @id = Random.rand(1..999_999_999)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    name.to_s
  end

  private

  def of_age?
    @age >= 18
  end

  def rent_book(book, date)
    rental = Rental.new(date, self, book)
    @rentals << rental
    book.rentals << rental
  end
end
