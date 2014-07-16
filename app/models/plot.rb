class Plot < ActiveRecord::Base
    belongs_to :plan
    has_many :notes
    has_one :parent_plot, class_name: :Plot
    belongs_to :parent_plot, :class_name => :Plot
    has_and_belongs_to_many :users

    validates :title, :presence => true
end
