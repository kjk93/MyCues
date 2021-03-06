Rails.application.routes.draw do
  root 'home_page#home'

  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :shows
  get 'show/:id/settings/quick_add_enabled' => 'shows#quick_add', as: 'quick_add'
  get 'show/:id/print' => 'shows#print', as: 'print_show'
  resources :cues
  #resources :user_settings, only:[:edit, :update, :destroy]

  get 'usettings/:id/edit' => 'user_settings#edit', as: 'edit_user_setting'
  patch 'usettings/:id' => 'user_settings#update', as: 'user_setting'
  put 'usettings/:id' => 'user_settings#update'
  delete 'usettings/:id' => 'user_settings#destroy'

  get 'ssettings/:id/edit' => 'show_settings#edit', as: 'edit_show_setting'
  patch 'ssettings/:id' => 'show_settings#update', as: 'show_setting'
  put 'ssettings/:id' => 'show_settings#update'
  delete 'ssetting/:id' => 'user_settings#destroy'

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
