Rails.application.routes.draw do
  get "(*redirect_path)", to: "batman#index", constraints: lambda { |request| request.format == "text/html" }

    devise_for :users

    resources :plans do
        resources :plots do
            resources :notes
        end

        resources :notes
    end
end
