MonsterOfTheWeek::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root "home_page#home"
  
  match '/signup',  to: 'users#new',         via: 'get'
  match '/signin',  to: 'sessions#new',      via: 'get'
  match '/signout', to: 'sessions#destroy',  via: 'delete'  
  match '/about',   to: 'home_page#about',   via: 'get'
  match '/contact', to: 'home_page#contact', via: 'get'
  match '/news',    to: 'home_page#news',    via: 'get'
  
end
