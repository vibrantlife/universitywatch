Rails.application.routes.draw do


  get '/abouttheproject' => 'schools#abouttheproject'
  get '/data' => 'schools#data'
  get 'heatmaps/create'

  get 'errors/file_note_found'
  get 'errors/unprocessable'
  get 'errors/internal_server_error'

  root 'schools#index'

  # set up compare route
  post 'schools/create_geo_location', :to => 'geoinfos#create', :as => 'create_geo_location'
  post 'heatmaps/store_array', :to => 'heatmaps#create', :as => 'store_array'
  get 'heatmaps/show', :to => 'heatmaps#show', :as => 'show_heatmap'

  resources :schools, only: [:index, :show] do
    collection do
      get 'json_search/:school_name', :action => 'json_search', :as => 'json_search'
      post 'search', :action => 'search_school', :as => 'search'
      get 'state/:state_name', :action => 'state', :as => 'state'
      get 'states', :action => 'states', :as => 'states'
      get 'compare', :action => 'compare', :as => 'compare'
      get 'compare_two', :action => 'compare_two', :as => 'compare_two'
      get 'state/:state_name/:school_type', :action => 'type', :as => 'type'

      get 'geo_location_info', :action => 'geo_location', :as => 'geo_location_info'
      get 'geo_info', :action => 'geo_info', :as => 'geo_info'
      get 'heatmap_page', :action => 'heatmap_page', :as => 'heatmap_page'
      get 'heatmap_data', :action => 'heatmap_data', :as => 'heatmap_data'
    end
  end
    resources :crimes, only: [:index] do
    collection do
      get 'murder', :action => 'murder', :as => 'murder'
      get 'manslaughter', :action => 'manslaughter', :as => 'manslaughter'
      get 'sexualassaultforcible', :action => 'sexualassaultforcible', :as => 'sexualassaultforcible'
      get 'sexualassaultnonforcible', :action => 'sexualassaultnonforcible', :as => 'sexualassaultnonforcible'
      get 'robbery', :action => 'robbery', :as => 'robbery'
      get 'aggravated_assault', :action => 'aggravated_assault', :as => 'aggravated_assault'
      get 'burglary', :action => 'burglary', :as => 'burglary'
      get 'auto_theft', :action => 'auto_theft', :as => 'auto_theft'
      get 'arson', :action => 'arson', :as => 'arson'
    end
  end

  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all



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
