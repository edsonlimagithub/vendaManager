VendaManager::Application.routes.draw do
  resources :empresas

  resources :fornecedors

  resources :item_nota_entradas

  resources :nota_entradas

  resources :rota_items

  match 'rota/pesquisa_kit',     :controller => 'kits', :action => 'pesquisa_kit'
  match 'rota/localiza_kit',     :controller => 'kits', :action => 'localiza_kit'
  match 'rota/inserir_kit_rota', :controller => 'kits', :action => 'inserir_kit_rota'
  match 'rota/excluir_item_kit', :controller => 'kits', :action => 'excluir_item_kit'
  
  match 'rota/pesquisa_brinde', :controller => 'kits', :action => 'pesquisa_brinde'  
  match 'rota/inserir_brinde_rota', :controller => 'kits', :action => 'inserir_brinde_rota'
  match 'rota/excluir_item_brinde', :controller => 'kits', :action => 'excluir_item_brinde'
  match 'rota/retorno_conferencia', :controller => 'rota',  :action => 'retorno_conferencia'
  match "rota/retorno_conferencia_result/:id", :controller => 'rota',  :action => 'retorno_conferencia_result'
  
  match 'rota/nova', :controller => 'rota', :action => 'nova'

  resources :rota

  resources :cidades

  resources :usuarios

  resources :clientes

  resources :vendedors

  resources :consignados	

  resources :item_consignados

  resources :item_kits
	
  resources :kits

  resources :subgrupos

  resources :grupos

  resources :produtos
  
  resources :usuarios
  
  match '/pesquisa_nota_entrada', :controller => 'produtos', :action => 'pesquisa_produto_autocomplete'
  match '/localiza_produto_id',   :controller => 'produtos', :action => 'localiza_produto_id'
  match '/inseri_produto_nota',   :controller => 'nota_entradas', :action => 'inseri_produto_nota'
  match '/exclui_produto_nota', :to => 'nota_entradas#exclui_produto_nota'
  match '/fecha_nota_entrada', :to => 'nota_entradas#fecha_nota_entrada' 
  
  match '/pesquisa_descricao',    :controller => 'produtos', :action => 'pesquisa_item'
  match '/localiza_produto',      :controller => 'produtos', :action => 'localiza_produto'
  
  match '/inserir_produto_kit',   :controller => 'item_kits', :action => 'inserir_produto_kit'
  match '/excluir_item_kit',      :controller => 'item_kits', :action => 'excluir_item_kit'

  match '/kits/novo', :controller => 'kits', :action => 'novo'
  
  root :to => 'login#login'
  #root :to => 'home#index'
  #root :controller => 'home', :action => 'index'
  match '/home', to: 'home#index'
  match '/do_login', to: 'login#do_login'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
