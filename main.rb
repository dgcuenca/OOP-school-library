require_relative './app'
require 'pry'

def main
  puts 'Welcome to School Library App!'
  books = []
  people = []
  rentals = []

  run_app(books, people)
end

def display_menu
  puts "Please choose an option by entering a number:
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit"
end

def run_app(books, people)
  loop do
    display_menu
    option = gets.chomp.to_i
    binding.pry
    case option
    when 1
      list_all_books(books)
    when 2
      list_all_people(people)
    when 3
      create_person(people)
    when 4
      create_book(books)
    when 5
      create_rental(books, people)
    when 6
      list_all_rentals_by_id()
    when 7
      exit_app
      break
    else
      puts 'Invalid input. Please enter a valid option.'
    end
  end
end

main
