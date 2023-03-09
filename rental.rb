require './person'
require './book'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    person.rentals << self
    book.rentals << self
  end
end
