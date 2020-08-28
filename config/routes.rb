Rails.application.routes.draw do
  resources :hikes_lists
  resources :hikes
  resources :lists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
