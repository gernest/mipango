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


    context 'working on an existing plan' do
        let(:plan){
            user.make_a_plan(Faker::Name.title)
        }
        describe "#take_a_note" do
            let(:note){
                {title: Faker::Name.title, body: Faker::Lorem.paragraph}
            }
            it 'should accept two arguments, plan object and note itself' do
                expect{user.take_a_note(plan,note)}.not_to raise_error
            end

            it {
                expect{user.take_a_note("plan",note)}.to raise_error( ArgumentError)
            }

            it 'should save the resulting  note object' do
                expect(user.take_a_note(plan,note)).to be_a_kind_of(Note)
            end

        end
        describe "#make_a_plot" do
            let(:plot){
                {title: Faker::Name.title, body: Faker::Lorem.paragraph}
            }

            it 'should take two argument, a plan object and the plot object and an extra parent_id' do
                expect{user.make_a_plot(plan,plot)}.not_to raise_error
            end

            it 'should set the parent_id field' do
                user.make_a_plot(plan,plot)
                test_plot=user.plots.first
                test_plot.parent_plot=test_plot
                expect(test_plot.parent_plot.id).to eql test_plot.id

            end

            it 'should update the many to many realationship' do
                user.make_a_plot(plan,plot)
                expect(user.plots.first).to be_a_kind_of Plot
            end

            it 'should save the plot' do
                expect{user.make_a_plot(plan,plot)}.not_to raise_error
            end
        end
    end

    context 'we are working on a plot' do
        let(:plan){
            user.make_a_plan(Faker::Name.title)
        }
        let(:plot){
            user.make_a_plot(plan,{title: Faker::Name.title, body: Faker::Lorem.paragraph})
            user.plots[0]
        }
        describe "#take_a_note" do
            let(:note){
                {title: Faker::Name.title, body: Faker::Lorem.paragraph}
            }

            it{
                expect{user.take_a_note(plot,note)}.not_to raise_error
            }
            it{
                expect(user.take_a_note(plot,note)).to be_a_kind_of Note
            }
        end
    end
end

