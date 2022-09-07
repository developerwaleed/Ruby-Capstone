require_relative('../classes/music_album/music_album.rb')

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('2002-02-02', 'name', on_spotify: true)
  end

  describe '#new' do
    it 'takes 2 parameters and returns a MusicAlbum object' do
      expect(@music_album).to be_instance_of MusicAlbum
    end
  end

  describe '#on_spotify' do
    it 'returns the correct state' do
      expect(@music_album.on_spotify).to eq true
    end
  end
  
  describe '#can_be_archived()' do
  it 'checks if the item be archieved' do
    expect(@music_album.can_be_archived?).to eq true
  end
end
end
