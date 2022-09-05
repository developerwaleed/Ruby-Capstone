require_relative 'helper_spec'

describe Book do
    before :each do
        @good_book = Book.new('2018-01-01', 'Chris Siku', 'good')
        @bad_book = Book.new('2022-09-01', 'Harold Mudosa', 'bad')
    end

    context 'Test the Book\'s class instances' do
        it 'should be an instance of the Book class' do
            expect(@good_book).to be_an_instance_of Book
        end

        it 'Method can_be_archived? should return false' do
            expect(@good_book.can_be_archived?).to be false
        end

        it 'Method can_be_archived? should return true' do
            expect(@bad_book.can_be_archived?).to be true
        end
    end
end