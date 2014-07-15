describe User do
    let(:user){
        create(:user)
    }
    describe "#make_a_plan" do

        let(:new_plan){
        new_plan=user.make_a_plan "Simple test plan"
        }

        it {
            expect{user.make_a_plan}.to raise_error
        }

        it {
            expect{user.make_a_plan("bla", "bla")}.to raise_error
        }

        it "should save the plan given a title" do
            expect(new_plan).to be_an_instance_of( Plan)
        end
    end


    context 'there is a plan a current user is working on' do
        let(:plan){
            user.make_a_plan(Faker::Name.title)
        }
        describe "#take_a_note" do
            it 'sould accept two arguments, plan object and note itself' do
            end
            it 'should have valid privilege to write on the object' do
            end
            it 'should save the resulting  note object' do
            end
        end
        describe "#make_a_plot" do
            it 'should take two argument, a plan object and the plot object' do
            end

            it 'should set the parent_id field' do
            end

            it 'should update the many to many realationship' do
            end

            it 'should save the plot' do
            end

        end
    end

    context 'we are working on a plot' do
        describe "#take_a_note" do
            it 'sould accept two arguments, plan object and note itself' do
            end
            it 'should have valid privilege to write on the object' do
            end
            it 'should save the resulting  note object' do
            end
        end
    end
end