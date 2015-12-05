Rails.application.routes.draw do
# <<<<<<< HEAD
  get '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  resources :adminusers do
    collection do
    get 'viewapplicants'
  end
  end
# =======
  resources :questions
  resources :questions
  resources :applicants
  resources :internship_applications
  resources :adminusers

# >>>>>>> e6b1b225c542ff112034bb5fade7eb2de6c16b30
  resources :jobs do
    collection do
      get 'viewapplicantsprofile'
      get 'viewapplicants'
      get 'sendemails'
      get 'interview_records'
    end
  end
  devise_for :users
  get 'pages/about'

  get 'pages/contact'
  root 'pages#index'
  match '/pages/applicant_home', :to => 'pages#home', :via => [:get]
  match '/pages/applicant_show_job', :to => 'pages#showjob', :via => [:get]
  match '/pages/applicant_apply_job', :to => 'pages#applyjob', :via => [:get]
  match '/pages/applicant_show_questions', :to => 'pages#showquestions', :via => [:get, :post]

  match '/pages/paidemployment', :to => 'pages#paidemployment', :via => [:get, :post]
  match '/pages/volunteer', :to => 'pages#volunteer', :via => [:get, :post]
  match '/pages/intern_application_review', :to => 'pages#internreview', :via => [:get, :post]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  match '/pages/internship_application_success', :to => 'pages#internapplicationsuccess', :via => [:get, :post]


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

  #get '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
end
