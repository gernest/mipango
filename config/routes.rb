Rails.application.routes.draw do

  root to: "main#index"
  devise_for :users
  resources :plans do
    resources :plots do
      resources :notes
    end

    resources :notes
  end
end
