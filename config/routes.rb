Educar::Application.routes.draw do

  resources :comments

  resources :itens

  get "questoes/dynamic_select_assuntos/:id", :controller => 'questoes', :action => 'dynamic_select_assuntos'
  post "questoes/dynamic_add_item", :controller => 'questoes', :action => 'dynamic_add_item'
  get "questoes/dynamic_add_item", :controller => 'questoes', :action => 'dynamic_add_item'
  resources :questoes

  resources :concursos do
    get :autocomplete_banca_nome, :on => :collection
  end
  resources :concursos

  resources :assuntos

  resources :materias

  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :users

  post "home/dynamic_add_comment", :controller => "home", :action => "dynamic_add_comment"
  post "home/dynamic_get_comment", :controller => "home", :action => "dynamic_get_comment"
  match 'home/resolvendo'
  #match 'home/dynamic_select_item/:id' => 'home#dynamic_select_item'
  get "home/dynamic_select_item/:id", :controller => 'home', :action => 'dynamic_select_item'

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
