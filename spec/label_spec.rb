require_relative 'helper_spec'

describe Label do
  before :each do
    @label = Label.new('My label', 'red')
  end

  context 'Test the Label class' do
    it 'should be an instance of the Label class' do
      expect(@label).to be_an_instance_of Label
    end

    it 'should have a title My label' do
      expect(@label.title).to eq('My label')
    end

    it 'should have a color red' do
      expect(@label.color).to eq('red')
    end

    it 'Chech the id is a number' do
      expect(@label.id).to be_an_instance_of Integer
    end

    it 'Should return the number of items in the label' do
      @label.add_item(Book.new('2022-09-04', 'Twitter', 'good'))
      @label.add_item(Book.new('2022-09-01', 'Linkedin', 'bad'))
      @label.add_item(Book.new('2022-09-02', 'Chris', 'good'))
      @label.add_item(Book.new('2022-09-03', 'Waleed', 'excellent'))
      @label.add_item(Book.new('2022-09-05', 'Harold', 'good'))
      expect(@label.items.length).to eq(5)
    end
  end
end
