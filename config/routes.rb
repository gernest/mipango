Rails.application.routes.draw do
  root to: "main#index"
  get "(*redirect_path)", to: "main#index", constraints: lambda { |request| request.format == "text/html" }

  devise_for :users

  resources :plans do
    resources :plots do
      resources :notes
    end

    resources :notes
  end
end
