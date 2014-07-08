Rails.application.routes.draw do
    devise_for :users

    resource :plan,:shallow => true do
        resource :plot, :shallow => true do
            resource :note
        end
        resource :note
    end
end
