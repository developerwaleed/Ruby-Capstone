class Run
    puts 'Welcome to my Catalog of things'
    puts "\n"
    def self.menu
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
        '9' => 'Add a game',
        '10' => 'Exit'
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
        puts 'List all books'
      when '2'
        puts 'List all labels'
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
        puts 'Add a book'
      when '9'
        puts 'Add a game'
      when '10'
        puts 'Thank you for consulting my catalog'
        exit
      else
        puts 'Please Enter a valid choice [1-10]'
      end
    end
end

def run_app
  Run.new
end
run_app
