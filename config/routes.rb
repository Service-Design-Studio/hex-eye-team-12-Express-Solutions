Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :services
  get '/services/:id/sub', to:'services#sub'
  root :to => redirect('/services')



end
