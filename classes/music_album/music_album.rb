require_relative('../item')

class MusicAlbum < item
    attr_accessor :on_spotify
    def initialize(on_spotify, publish_date, archived: false)
        super(publish_date, archived)
        @on_spotify = on_spotify
    end
end