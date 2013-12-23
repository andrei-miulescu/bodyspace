require 'sidekiq/web'

Bodyspace::Application.routes.draw do
  root :to => 'home#ember'
  authenticate :user do
    mount Sidekiq::Web.new, at: '/sidekiq'
  end
  use_doorkeeper
  namespace :api, defaults: {format: 'json'} do

    get 'search_supplements', to: 'search_supplements#search'

    resources :supplements

    resources :diets

    resources :timelines

    resources :posts

    match 'posts/create_with_image', to: 'posts#create_with_image', via: [:put, :post]
    match 'timelines/create_with_image', to: 'timelines#create_with_image', via: [:put, :post]

    devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions'}
    resources :users, :posts, :timelines


    get '/t/:id.json', to: 'timelines#with_posts'
  end

  get '*path' => 'home#ember'

end