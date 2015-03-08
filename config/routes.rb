require 'api_constraints'
Rails.application.routes.draw do
  
 

  #
  # scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
     # devise_for :users, path: '/api/users',controllers: {
    #    sessions: 'api/v1/custom_devise/sessions'
    #  }
  #  end
   
  namespace :api, defaults: {format: 'json'} do
    devise_for :users, path: '/users',controllers: {
      sessions: 'api/v1/custom_devise/sessions'
    }
    
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do 
      #devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
      resources :users, :only => [:index]  do
        collection do
          get :users_missions
        end
      end
      resources :about_studies, :path => "mission_studies", :only => [:index,:show] 
      resources :missions 
      resources :surveys 
    end
  end
  
  
  namespace :admin do 
   # mount SurveyorGui::Engine => "/manage_surveys", :as => "manage_surveys" 
   resources :about_studies, :path => "mission_studies", :only => [:edit,:show,:create,:update] 
    resources :languages
    resources :missions
    resources :countries
    resources :users
       
  end
  scope '/admin' do
    mount SurveyorGui::Engine => "/surveyor_gui", :as => "surveyor_gui"
  end
  mount Surveyor::Engine => "/surveys", :as => "surveyor"
   


  root :to => "home#index"
  
  get 'home/index'
  get "/admin" => "admin/base#index", :as => "admin"
  get "/admin/surveyor_gui/surveyforms", :as => "admin_surveyforms"

  get '/assets/pictures/:id/:style/:basename.:format' => 'admin/missions#get_picture' 


  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  
  # namespace :api, defaults: { format: :json } do
  #   devise_for(:users, :controllers => { :sessions => "sessions" })
  #     resources :session, only: [:create, :destroy]
  #   # resources :clients, only: [:index, :create, :update, :destroy, :show]
  # end
  

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
