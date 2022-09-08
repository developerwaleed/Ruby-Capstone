require_relative 'helper_spec'

describe Author do
  before :each do
    @zabuza = Author.new('Deidara', 'Danzo')
  end

  context 'Test for Author class' do
    it 'should be instance of author' do
      expect(@zabuza).to be_an_instance_of Author
    end

    it 'should return first-name' do
      expect(@zabuza.first_name).to eq('Deidara')
    end

    it 'should return last-name' do
      expect(@zabuza.last_name).to eq('Danzo')
    end

      it 'Should return the number of items in the label' do
        @zabuza.add_item(Game.new('2011-12-21', 'yes', '2019-12-25'))
        @zabuza.add_item(Game.new('2011-12-21', 'yes', '2019-12-25'))
        @zabuza.add_item(Game.new('2011-12-21', 'yes', '2019-12-25'))
        expect(@zabuza.items.length).to eq(3)
      end
  end
end
