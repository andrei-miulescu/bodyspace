require 'sidekiq/web'

Bodyspace::Application.routes.draw do
  get 'search_supplements', to: 'search_supplements#search'
  use_doorkeeper
  resources :supplements

  resources :diets

  resources :timelines

  resources :posts

  match 'posts/create_with_image', to: 'posts#create_with_image', via: [:put, :post]
  match 'timelines/create_with_image', to: 'timelines#create_with_image', via: [:put, :post]

  root :to => 'home#ember'
  devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions'}
  resources :users, :posts , :timelines


  authenticate :user do

    mount Sidekiq::Web.new, at: '/sidekiq'
  end

  get '/t/:id.json',  to: 'timelines#with_posts'

end