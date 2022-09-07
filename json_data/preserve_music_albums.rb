require 'json'

module AlbumsPersistence
  def store_albums(albums)
    data = []
    file = './json_data/albums.json'
    return unless File.exist?(file)

    albums.each do |album|
      data << { publish_date: album.publish_date, name: album.name, on_spotify: album.on_spotify }
    end
    File.write(file, JSON.generate(data))
  end

  def load_albums
    data = []
    file = './json_data/albums.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |album|
      data << MusicAlbum.new(album['publish_date'], album['name'], on_spotify: album['on_spotify'])
    end
    data
  end
end