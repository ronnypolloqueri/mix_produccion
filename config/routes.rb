ProgramacionACortoPlazo::Application.routes.draw do
  get "paginas/index", as: :index

  get "paginas/ingrese_productos"
  post "paginas/guardar_productos", as: :guardar_productos
  get "paginas/variables_produccion/:id" => 'paginas#variables_produccion', as: :variables_produccion

  put "paginas/guardar_variables_produccion/:id" => 'paginas#guardar_variables_produccion', as: :guardar_variables_produccion
  patch "paginas/guardar_variables_produccion/:id" => 'paginas#guardar_variables_produccion'

  put "paginas/update_produccion_diaria/:id" => 'paginas#update_produccion_diaria', as: :update_produccion_diaria
  patch "paginas/update_produccion_diaria/:id" => 'paginas#update_produccion_diaria'

  get "paginas/produccion_diaria/:id" => 'paginas#produccion_diaria', as: :produccion_diaria

  get "paginas/costos_totales/:id" => 'paginas#costos_totales', as: :costos_totales
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'paginas#index'

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
