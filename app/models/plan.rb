class Plan < ActiveRecord::Base
    belongs_to :user
    has_many :notes
    has_many :plots

    validates :title, :presence => true, :uniqueness => true
end
