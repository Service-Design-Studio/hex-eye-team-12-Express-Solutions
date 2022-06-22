Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Resources: model
  resources :services
  
  # Custom routes
  # url for services, with a id in parameters, to: controller
  get '/services/:id/sub', to:'services#sub', as: 'sub_services'
  get '/services/:id/time_estimate', to:'services#time_estimate', as: 'time_estimate'
<<<<<<< Updated upstream
  get '/more', to:'services#more', as: 'more_services'
=======
>>>>>>> Stashed changes

  root :to => redirect('/services')



end
