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
  get '/more', to:'services#more', as: 'more_services'
<<<<<<< HEAD
  get '/services/:id/show_QR', to:'services#show_QR', as: 'show_QR'
  get '/more/more_QR', to:'services#more_QR', as: 'more_QR'
=======
  get '/search', to:'services#search', as: 'search_services'
>>>>>>> ef0447f (search bar wip 1)

  get ':not_found' => redirect('/'), :constraints => { :not_found => /.*/ }

  root :to => redirect('/services')



end
