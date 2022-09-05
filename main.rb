require_relative 'app'

class Run
  app = App.new
  puts 'Welcome to my Catalog of things'
  def self.menu
    puts "\n"
    puts 'Please select from the following options:'
    @options = {
      '1' => 'List all books',
      '2' => 'List all labels',
      '3' => 'List all music albums',
      '4' => 'List all genres',
      '5' => 'List of games',
      '6' => 'List all authors',
      '7' => 'Add a music album',
      '8' => 'Add a book',
      '9' => 'Add a label',
      '10' => 'Add a game',
      '11' => 'Exit'
    }

    @options.each do |key, value|
      puts "#{key} - #{value}"
    end

    print 'Choice : '
    gets.chomp
  end

  loop do
    case menu
    when '1'
      app.list_books
    when '2'
      app.list_labels
    when '3'
      puts 'List all music albums'
    when '4'
      puts 'List all genres'
    when '5'
      puts 'List of games'
    when '6'
      puts 'List all authors'
    when '7'
      puts 'Add a music album'
    when '8'
      app.add_book
    when '9'
      app.add_label
    when '10'
      puts 'Add a game'
    when '11'
      app.message('Thank you for consulting my catalog')
      exit
    else
      app.message('Please Enter a valid choice [1-10]')
    end
  end
end

def run_app
  Run.new
end
run_app
