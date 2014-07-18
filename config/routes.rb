Rails.application.routes.draw do

  devise_for :users
  resources :plans do
    resources :plots do
      resources :notes
    end

    resources :notes
  end
end
