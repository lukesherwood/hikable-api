Rails.application.routes.draw do

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
      resources :hikes
      resources :lists
      resources :users
    end
  end
end
