MonsterOfTheWeek::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles
  resources :files

  root "home_page#home"
  
  match '/signup',     to: 'users#new',         via: 'get'
  match '/signin',     to: 'sessions#new',      via: 'get'
  match '/signout',    to: 'sessions#destroy',  via: 'delete'  
  match '/about',      to: 'home_page#about',   via: 'get'
  match '/contact',    to: 'home_page#contact', via: 'get'
#  match '/articles',   to: 'articles#index',    via: 'get'
#  match '/news/new',   to: 'articles#new',      via: 'get'
#  match '/news/edit',  to: 'news#edit',         via: 'get'
#  match '/articles/delete', to: 'articles#destroy',     via: 'delete'
#  match '/files',      to: 'files#downloads',   via: 'get'
#  match '/addfile',    to: 'files#new',         via: 'get'
#  match '/updatefile', to: 'files#edit',        via: 'get'
#  match '/deletefile', to: 'files#destroy',     via: 'delete'
  
end
