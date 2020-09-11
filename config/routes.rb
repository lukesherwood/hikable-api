Rails.application.routes.draw do
  namespace :app do 
    namespace :v1 do
    resources :hikes
    resources :lists
    resources :users
    end
  end
end
