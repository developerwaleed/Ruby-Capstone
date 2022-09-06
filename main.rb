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
end