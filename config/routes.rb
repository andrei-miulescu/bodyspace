Bodyspace::Application.routes.draw do
  resources :diets

  resources :timelines

  resources :posts

  root :to => 'home#index'
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :users, :posts , :timelines


  get '/sups', to: 'diets#search_supplement'
  get '/t/:id.json',  to: 'timelines#with_posts'
end