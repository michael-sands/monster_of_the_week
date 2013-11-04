MonsterOfTheWeek::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users, only: [ :new, :edit, :show, :update ]
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles
  resources :downloadable_files

  root "home_page#home"
  
  match '/signup',     to: 'users#new',         via: 'get'
  match '/signin',     to: 'sessions#new',      via: 'get'
  match '/signout',    to: 'sessions#destroy',  via: 'delete'  
  match '/about',      to: 'home_page#about',   via: 'get'
  match '/contact',    to: 'home_page#contact', via: 'get'
  
end
