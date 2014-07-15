class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :notes
    has_many :plans
    has_and_belongs_to_many :plots

    def make_a_plan(title)
        self.plans.create(:title => title)
    end

    def take_a_note(model, note)
        if model.instance_of?(Plan) and self.id==model.user_id
            self.plans.find_by_id(model.id).notes.create!(note)
        elsif model.instance_of?(Note) and self.id==model.id
            self.plans.find_by_id(model.plan_id).plots.notes.create!(note)
        else
            raise ArgumentError
        end
    end

    def make_a_plot(plan, plot)
        new_plot=self.plans.find_by_id(plan.id).plots.create! plot
        self.plots<<new_plot
        new_plot
    end
end
