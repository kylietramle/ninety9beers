Rails.application.routes.draw do
  devise_for :users
  resources :activities
  resources :users
  
  get '/home' => 'pages#home'
  root to: 'activities#index'
  get '/beers' => 'beers#index'
  post '/beers' => 'beers#create'
  get '/beers/search' => 'beers#search'
  post '/beers/search' => 'beers#search'
  get '/beers/:id' => 'beers#show'
  get '/beers/:id/edit' => 'beers#edit'
  patch '/beers/:id' => 'beers#update'
  delete '/beers/:id' => 'beers#destroy'
  

  patch '/custom_beers/:id' => 'custom_beers#update'
  get '/custom_beers/new' => 'custom_beers#new'
  get '/custom_beers/:id' => 'custom_beers#show'
  post '/custom_beers' => 'custom_beers#create'
  get '/custom_beers/:id/edit' => 'custom_beers#edit'
  delete '/custom_beers/:id' => 'custom_beers#destroy'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
