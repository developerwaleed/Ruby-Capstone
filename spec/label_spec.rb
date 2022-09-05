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
    end
end