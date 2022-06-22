Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Resources: model
  resources :services
  
  # Custom routes
  # url for services, with a id in parameters, to: controller
  get '/services/:id/sub', to:'services#sub', as: 'sub_service'
  get '/services/:id/time_estimate', to:'services#time_estimate', as: 'time_estimate'

  root :to => redirect('/services')



end
