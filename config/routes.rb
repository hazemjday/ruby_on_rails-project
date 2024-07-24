Rails.application.routes.draw do
  # Éviter de définir devide_for deux fois
  devise_for :users
  
  root to: 'homes#page1'

  # Dashboard routes
  authenticated :user, lambda { |u| u.admin? } do
    get 'admin_dashboard', to: 'admin_dashboard#index', as: :admin_dashboard
  end

  authenticated :user do
    get 'user_dashboard', to: 'user_dashboard#index', as: :user_dashboard
  end

  get 'user_dashboard/index'
  get 'admin_dashboard/index'


  resources :homes do
    resources :comments
    member do
      get 'success'
    
    end
    collection do
      get 'admin'
    end
  end

  # Autres routes
  get "/about", to: "homes#about"

  get "home/response", to: "homes#response"
get "home/adminshow/:id", to: "homes#adminshow"
end

