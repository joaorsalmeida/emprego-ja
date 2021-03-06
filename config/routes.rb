Rails.application.routes.draw do

devise_for :users
#Modify Sign in and out routes
devise_for :general_admins
devise_scope :general_admin do
  get '/sign_in', to: 'devise/sessions#new'
  get '/sign_out',to: 'devise/sessions#destroy'
  end
devise_for :company_admins, skip: :registrations
#, controllers: {sessions: 'sessions'}
get '/companies/:company_id/job_positions/canceladas', to: 'job_positions#canceladas'
get 'home/index'
get '/companies/:company_id/job_positions/expiradas', to: 'job_positions#expired'

resources :companies do
  resources :job_positions do
    resources :job_applications
  end
  resources :recommendations
end 

root 'home#index'

resources :job_categories, only: [:edit, :new, :show, :create,:index]

  # get 'companies/index'

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
