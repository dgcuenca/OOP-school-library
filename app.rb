require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

def list_all_books(books)
    if books.empty?
      puts 'Books Not Found'
    else
      books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end  

  def list_all_people(people)
    if people.empty?
      puts 'People Not Found'
    else
      people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end
  
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    role = gets.chomp.to_i
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp.to_s
  
    case role
    when 1
      puts 'Has parents permission? [Y/N]: '
      permission = gets.chomp.downcase == 'y'
      student = Student.new(classroom: nil, age: age, name: name, parent_permission: permission)
      puts 'Student created successfully'
      student
    when 2
      puts 'Specialization: '
      specialization = gets.chomp.to_s
      teacher = Teacher.new(name: name, age: age, specialization: specialization)
      puts 'Teacher created successfully'
      teacher
    else
      puts 'Invalid input'
      nil
    end
  end  

  def create_book(books)
    puts 'Title: '
    title = gets.chomp.to_s
    puts 'Author: '
    author = gets.chomp.to_s
    book = Book.new(title: title, author: author)
    books << book
    puts 'Book created successfully'
    book
  end

  def create_rental(books, people, rentals)
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
  
    book_selected = nil
    loop do
      book_selected = gets.chomp.to_i
      break if book_selected >= 0 && book_selected < books.length
      puts "Invalid selection. Please enter a number between 0 and #{books.length - 1}"
    end
  
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  
    person_selected = nil
    loop do
      person_selected = gets.chomp.to_i
      break if person_selected >= 0 && person_selected < people.length
      puts "Invalid selection. Please enter a number between 0 and #{people.length - 1}"
    end
  
    puts 'Date: '
    date = gets.chomp
  
    rental = Rental.new(date: date, person: people[person_selected], book: books[book_selected])
    rentals << rental
    puts 'Rental created successfully'
    rental
  end
  
  def list_all_rentals_by_id(rentals)
    puts 'Enter the ID of the person:'
    id = nil
    loop do
      id = gets.chomp.to_i
      break if id > 0
      puts 'Invalid ID. Please enter a positive integer.'
    end
  
    rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end  

def exit_app
  puts 'See you!'
end