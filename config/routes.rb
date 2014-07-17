Rails.application.routes.draw do

  devise_for :users
  get "(*redirect_path)", to: "batman#index", constraints: lambda { |request| request.format == "text/html" }


  resources :plans do
    resources :plots do
      resources :notes
    end

    resources :notes
  end
end
