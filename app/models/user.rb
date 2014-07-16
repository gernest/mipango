class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :notes
    has_many :plans
    has_and_belongs_to_many :plots

    def make_a_plan(title)
        self.plans.create!(:title => title)
    end

    def take_a_note(model, note)
        @note=note
        @note[:user_id]=self.id

        if model.instance_of?(Plan) and belongs_to_current_user(model)
            model.notes.create!(@note)
        elsif model.instance_of?(Plot)
            #check if this user is one of the authors  and save
            unless model.users.empty?
                model.users.each do |usr|
                    if usr.id==self.id
                        return model.notes.create(@note)
                    end
                end
            end
        else
            raise ArgumentError
        end
    end

    def make_a_plot(plan, plot)
        new_plot=self.plans.find_by_id(plan.id).plots.create(plot)
        self.plots<<new_plot
    end

    private
    def belongs_to_current_user(klass)
        if klass.user_id==self.id
            true
        else
            false
        end
    end
end
