class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :notes
    has_many :plans
    has_and_belongs_to_many :plots

    def make_a_plan(title)
        self.plans.create(:title=>title)
    end
end
