require_relative 'helper_spec'

describe Label do
    before :each do
        @label = Label.new('My label', 'red')
    end

    context 'Test the Label class' do
        it 'should be an instance of the Label class' do
            expect(@label).to be_an_instance_of Label
        end
    end
end