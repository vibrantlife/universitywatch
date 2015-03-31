Rails.application.routes.draw do


  get '/abouttheproject' => 'schools#abouttheproject'
  get '/data' => 'schools#data'
  root 'schools#index'

  # set up compare route

  resources :schools, only: [:index, :show] do
    collection do
      get 'json_search/:school_name', :action => 'json_search', :as => 'json_search'
      post 'search', :action => 'search_school', :as => 'search'
      get 'state/:state_name', :action => 'state', :as => 'state'
      get 'states', :action => 'states', :as => 'states'
      get 'compare', :action => 'compare', :as => 'compare'
      get 'compare_two', :action => 'compare_two', :as => 'compare_two'
      get 'state/:state_name/:school_type', :action => 'type', :as => 'type'
    end
    resources :crimes, only: [:index]
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
    # get 'states/' => 'catalog#view'

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
