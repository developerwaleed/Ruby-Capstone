require './spec/helper_spec'
require './json_data/preserve_data_module'
require './json_data/preserve_music_albums'

class App
  include PreserveJsonData
  include AlbumsPersistence

  def initialize
    @books = []
    @labels = []
    @music_album = []
    @genres = []
    @games = []
    @authors = []
    load_all_json_data
  end

  def empty(array)
    array.empty?
  end

  def message(text)
    puts "\n#{text}\n\n"
  end

  def list_games
    if empty(@games)
      message('No game in the catalog')
      return
    end
    puts "\n"

    @games.each do |game|
      puts "publish date: #{game.publish_date}, multiplayer: #{game.multiplayer}, last_played_at: #{game.last_played_at}"
    end
  end

  def list_authors
    if empty(@authors)
      message('No author in the catalog')
      return
    end
    puts "\n"

    @authors.each_with_index do |author, i|
      puts "#{i + 1}) #{author.first_name} #{author.last_name}"
    end
  end

  def add_label
    print 'Label title : '
    title = gets.chomp

    print 'Label color : '
    color = gets.chomp

    label = Label.new(title, color)
    @labels.push(label)
    message('New Label added successfully')
  end

  def add_game
    print 'Publish date [YYYY-MM-DD] : '
    publish_date = gets.chomp

    print 'Is multiplayer game? [ yes, no ]: '
    multiplayer = gets.chomp

    case multiplayer
    when 'yes'
      multiplayer_value = 'yes'
    when 'no'
      multiplayer_value = 'no'
    else
      puts 'yes or no'
      multiplayer_value = gets.chomp
    end

    print 'Last played at[YYYY-MM-DD]: '
    last_played_at = gets.chomp

    game = Game.new(publish_date, multiplayer_value, last_played_at)
    @games.push(game)
    message('New Game added successfully')
  end

  def add_author
    print 'Creator\'s first name: '
    first_name = gets.chomp

    print 'Creator\'s last name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    @authors.push(author)
    message('New Game added successfully')
  end

  def add_book
    print 'Publish date [YYYY-MM-DD] : '
    publish_date = gets.chomp

    print 'Book Publisher : '
    publisher = gets.chomp

    puts 'Enter Book Cover State'
    print '[bad, medium, good, excellent]: '
    cover_state = gets.chomp

    book = Book.new(publish_date, publisher, cover_state)
    @books.push(book)
    message('New Book added successfully')
  end

  def list_books
    if empty(@books)
      message('No books in the catalog')
      return
    end
    puts "\n"
    @books.each_with_index do |book, i|
      puts "#{i + 1}) #{book.cover_state} book published by #{book.publisher} on #{book.publish_date}"
    end
  end

  def list_music_albums
    if empty(@music_album)
      message('No MusicAlbum in the catalog')
      return
    end
    puts "\n"
    @music_album.each_with_index do |album, i|
      puts "#{i + 1}) #{album.name} || published on #{album.publish_date} || is_on_spotify? #{album.on_spotify}"
    end
  end

  def add_music_album
    print 'Album Name : '
    name = gets.chomp

    print 'Publish date [YYYY-MM-DD] : '
    publish_date = gets.chomp

    print 'Is it on spotify? [y/n]: '
    spotify = gets.chomp
    spotify = spotify == 'y'

    album = MusicAlbum.new(publish_date, name, on_spotify: spotify)
    @music_album.push(album)
    message('New Album added successfully')
  end

  def list_labels
    if empty(@labels)
      message('No Label in the catalog')
      return
    end
    puts "\n"
    @labels.each do |label|
      puts "[Id:#{label.id}] '#{label.title}' => #{label.color}"
    end
  end

  def list_genres
    if empty(@genres)
      message('No genre in the catalog')
      return
    end
    puts "\n"
    @genres.each do |genre|
      puts "ID: #{genre.id} | Name: #{genre.name}"
    end
  end

  def save_all_json_data
    books = []
    labels = []
    games = []
    authors = []
    # Save books
    @books.each do |book|
      books.push({
                   publish_date: book.publish_date,
                   publisher: book.publisher,
                   cover_state: book.cover_state
                 })
    end
    save_json_data(books, 'books')

    # Save labels
    @labels.each do |label|
      labels.push({
                    title: label.title,
                    color: label.color
                  })
    end
    save_json_data(labels, 'labels')
    store_albums(@music_album)

    # Save games

    @games.each do |game|
      games.push({
                   publish_date: game.publish_date,
                   multiplayer: game.multiplayer,
                   last_played_at: game.last_played_at
                 })
    end
    save_json_data(games, 'games')
    # Save authors

    @authors.each do |author|
      authors.push({
                     first_name: author.first_name,
                     last_name: author.last_name
                   })
    end
    save_json_data(authors, 'authors')
  end

  def load_all_json_data
    # Load books
    books = load_json_data('books')
    books.each do |book|
      @books.push(Book.new(book['publish_date'], book['publisher'], book['cover_state']))
    end

    # Load labels
    labels = load_json_data('labels')
    labels.each do |label|
      @labels.push(Label.new(label['title'], label['color']))
    end
    @music_album = load_albums

    # Load games
    games = load_json_data('games')
    games.each do |game|
      @games.push(Game.new(game['publish_date'], game['multiplayer'], game['last_played_at']))
    end

    # Load authors
    authors = load_json_data('authors')
    authors.each do |author|
      @authors.push(Author.new(author['first_name'], author['last_name']))
    end
  end
end
