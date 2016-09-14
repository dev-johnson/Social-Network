Rails.application.routes.draw do
  resources :user_pages

  get '/users/sign_in',                           to: redirect('/login')

devise_for :users, controllers: {sessions: "user_sessions", registrations: "registrations", :confirmations => 'confirmations'}

 # ---------------------------------------------------------------------------------------------------------------------------
 # DEVISE CUSTOM ROUTES
 # ---------------------------------------------------------------------------------------------------------------------------
 devise_scope :user do
       get   "/login"                                      => "user/sessions#new"
       post   "/login"                                      => "user/sessions#create"
       get   "/logout"                                     => "user/sessions#destroy"
       get   "/register"                                   => "user/registrations#new"
       get   "/recover"                                    => "user/passwords#new"
       post   "/updates"                             => "user/registrations#create"
       get "/approve"              => "user/registrations#user_approval"
       get "users/:id"                   => "user/registrations#show"
       get "users/:id/edit"               =>"user/registrations#edit"
      patch  "/users"                =>"user/registrations#update"

 end

 # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'user_pages#index'

  resources :comments

  post "/like"=> "user_pages#like_count"


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
