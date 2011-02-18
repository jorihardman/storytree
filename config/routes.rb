Storytree::Application.routes.draw do
  resources :forests do
    resources :seeds do
      resources :leaves do
        member do
          post 'create'
        end
      end
    end
  end

  resources :users
  resource :session, :to => 'user_sessions'
  match '/my_account' => 'users#my_account', :as => :my_account
  #match '/auth/facebook/callback' => 'sessions#create'
  #match '/signout' => 'sessions#destroy', :as => :signout

  match '/home/about', :as => :about
  match '/home/contact_us', :as => :contact_us

  root :to => 'home#index'
end
