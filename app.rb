require './spec/helper_spec'
require './json_data/preserve_data_module'

class App
  include PreserveJsonData
  def initialize
    @books = []
    @labels = []
    @music_album = []
    load_all_json_data
  end

  def is_empty(array)
    array.empty?
  end

  def message(text)
    puts "\n#{text}\n\n"
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
    if is_empty(@books)
      message('No books in the catalog')
      return
    end
    puts "\n"
    @books.each_with_index do |book, i|
      puts "#{i + 1}) #{book.cover_state} book published by #{book.publisher} on #{book.publish_date}"
    end
  end

  def list_music_albums
    if is_empty(@music_album)
      message('No MusicAlbum in the catalog')
      return
    end
    puts "\n"
    puts @music_album.inspect
    @music_album.each_with_index do |album, i|
      puts "#{i + 1}) #{album.name} || published on #{album.publish_date} || is_on_spotify? #{album.on_spotify}"
    end
  end

  def list_labels
    if is_empty(@labels)
      message('No Label in the catalog')
      return
    end
    puts "\n"
    @labels.each do |label|
      puts "[Id:#{label.id}] '#{label.title}' => #{label.color}"
    end
  end

  def save_all_json_data
    books = []
    labels = []
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
  end
end


