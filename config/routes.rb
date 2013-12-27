require 'sidekiq/web'

Bodyspace::Application.routes.draw do
  root :to => 'home#ember'

  mount Sidekiq::Web.new, at: '/febb71cd8d87b737e6e8b049e2384b79/sidekiq'

  use_doorkeeper

  devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions'}

  resources :supplements

  resources :diets

  resources :timelines

  resources :workouts

  resources :exercises

  resources :nutritional_items

  resources :posts

  resources :users

  get 'search_supplements', to: 'search#search_supplements'

  get 'view_exercise', to: 'exercises#view_exercise'

  get 'search_exercises', to: 'search#search_exercises'

  match 'posts/create_with_image', to: 'posts#create_with_image', via: [:put, :post]

  match 'timelines/create_with_image', to: 'timelines#create_with_image', via: [:put, :post]

  get '/t/:id.json', to: 'timelines#with_posts'

  get '*path' => 'home#ember'

end