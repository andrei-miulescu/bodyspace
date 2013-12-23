require 'sidekiq/web'

Bodyspace::Application.routes.draw do
  root :to => 'home#ember'
  authenticate :user do
    mount Sidekiq::Web.new, at: '/sidekiq'
  end

  use_doorkeeper

  resources :supplements

  resources :diets

  resources :timelines

  resources :nutritional_items

  resources :posts

  resources :users

  get 'search_supplements', to: 'search_supplements#search'

  match 'posts/create_with_image', to: 'posts#create_with_image', via: [:put, :post]

  match 'timelines/create_with_image', to: 'timelines#create_with_image', via: [:put, :post]

  devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions'}

  get '/t/:id.json', to: 'timelines#with_posts'

  get '*path' => 'home#ember'


end