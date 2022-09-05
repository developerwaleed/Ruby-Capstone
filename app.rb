require_relative '../spec/spec_helper'
class App
    def initialize
        @books = []
        @labels = []
    end
    
    def add_book
        print "Publish date [YYYY / MM / DD] : "
        publish_date = gets.chomp

        print "Book Publisher : "
        publisher = gets.chomp

        puts "Enter Book Cover State"
        print"[bad, medium, good, excellent]: " 
        cover_state = gets.chomp

        book = Book.new(publish_date, publisher, cover_state)
        @books.push(book)
        puts "New Book added successfully"
    end
end 