Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
    devise_for :users, defaults: { format: :json }
    resources :hikes
    resources :lists
    resources :users
    end
  end
end
