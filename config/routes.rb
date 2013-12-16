ProgramacionACortoPlazo::Application.routes.draw do
  get "paginas/index", as: :index

  get "paginas/prueba", as: :prueba

  get "paginas/buscar" => 'paginas#buscar', as: :buscar

  delete "paginas/eliminar/:id" => 'paginas#destroy', as: :eliminar_archivo
  get "paginas/ingrese_productos", as: :nuevo_archivo

  get "paginas/productos/:id/edit" => 'paginas#edit_ingrese_productos', as: :edit_ingrese_productos

  put "paginas/productos/:id" => 'paginas#update_ingrese_productos', as: :update_archivo_productos
  patch "paginas/productos/:id" => 'paginas#update_ingrese_productos'

  post "paginas/guardar_productos", as: :guardar_productos

  get "paginas/variables_produccion/:id" => 'paginas#variables_produccion', as: :variables_produccion
  get "paginas/variables_produccion/:id/edit" => 'paginas#edit_variables_produccion', as: :edit_variables_produccion
  put "paginas/update_variables_produccion/:id" => 'paginas#update_variables_produccion', as: :update_variables_produccion
  patch "paginas/update_variables_produccion/:id" => 'paginas#update_variables_produccion'


  get "paginas/produccion_diaria/:id" => 'paginas#produccion_diaria', as: :produccion_diaria
  get "paginas/produccion_diaria/:id/edit" => 'paginas#edit_produccion_diaria', as: :edit_produccion_diaria
  put "paginas/update_produccion_diaria/:id" => 'paginas#update_produccion_diaria', as: :update_produccion_diaria
  patch "paginas/update_produccion_diaria/:id" => 'paginas#update_produccion_diaria'


  get "paginas/produccion_diaria_aleatoria/:id" => 'paginas#produccion_diaria_aleatoria', as: :produccion_diaria_aleatoria

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
