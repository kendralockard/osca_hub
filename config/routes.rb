Rails.application.routes.draw do
  root 'static_pages#home'

  get 'password_resets/new'
  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'
  get 'users/approve_user'

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

  get '/join_coop', to: "coops#join"
  patch '/join_coop', to: "coops#join"

  post '/announcements/:id', to: "announcements#push_announcement"
  post '/events/:id', to: "events#push_event"

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :announcements,       only: [:create, :destroy, :push_announcement]
  resources :menus,               only: [:create, :destroy]
  resources :events,              only: [:create, :destroy, :push_event]
  resources :coops
end
