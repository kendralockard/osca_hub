Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',     to: 'static_pages#help'
  get  '/about',    to: 'static_pages#about'
  get  '/contact',  to: 'static_pages#contact'
  get '/menus',      to: 'static_pages#menu'
  get '/saveplates',  to: 'static_pages#save_plates'
  get '/workchart',   to: 'static_pages#workchart'

  get '/subrequests', to: 'static_pages#sub_requests'
  delete '/events/destroy/:id', to: 'events#destroy'

  get '/signup',    to: 'users#new'
  post '/signup',   to: 'users#create'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  patch '/users/:id/edit', to: 'users#edit'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :announcements,       only: [:create, :destroy]
  resources :menus,               only: [:create, :destroy]
  resources :events,              only: [:create, :destroy]
end
