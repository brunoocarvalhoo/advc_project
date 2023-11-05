Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticated :user do
    root to: 'home#athletes', as: :authenticated_root
  end

  unauthenticated do
    root to: 'home#index', as: :unauthenticated_root
  end

  get 'home/events', to: 'home#events', as: 'events'
  get 'users/users_manager', to: 'users#users_manager', as: 'users_manager'
  get 'users/delete_user', to: 'users#delete_user', as: 'delete_user'
  patch 'users/update_user', to: 'users#update_user', as: 'update_user'
end
