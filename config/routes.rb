Bodyspace::Application.routes.draw do
  resources :timelines

  resources :posts

  root :to => 'home#index'
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :users, :posts , :timelines



  get '/t/:id.json',  to: 'timelines#with_posts'
end