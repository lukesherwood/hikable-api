Rails.application.routes.draw do
  root to: 'api/v1/hikes#home'

  devise_for :users,
             defaults: { format: :json },
             class_name: 'User',
             controllers: {
               sessions: 'api/v1/sessions',
               registrations: 'api/v1/registrations'
             },
             path_prefix: '/api/v1'

  namespace :api do
    namespace :v1 do
      resources :hikes do
        resources :reviews, only: %i[index create]
      end
      post '/hikes/search_hikes', to: 'hikes#search_hikes'
      put 'hikes/:id/remove_hike_list', to: 'hikes#remove_hike_list'
      resources :lists
      devise_scope :user do
        get '/users/auto_login', to: 'sessions#auto_login'
      end
    end
  end
end
