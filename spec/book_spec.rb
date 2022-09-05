require_relative 'helper_spec'

describe Book do
    before :each do
        @good_book = Book.new('2018-01-01', 'Chris Siku', 'good')
    end

    context 'Test the Book\'s class instances' do
        it 'should be an instance of the Book class' do
            expect(@good_book).to be_an_instance_of Book
        end
    end
end