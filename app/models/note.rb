class Note < ActiveRecord::Base
    belongs_to :user
    belongs_to :plan
    belongs_to :plot

    validates :title, :presence => true
    validates :body, :presence => true
end
