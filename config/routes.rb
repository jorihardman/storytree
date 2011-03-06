Storytree::Application.routes.draw do
  resources :works

  resources :forests do
    resources :seeds do
      resources :branches do
        member do
          post 'create'
          post 'publish' => 'works#publish', :as => 'publish'
        end
      end
    end
  end

  resources :users do
    member do
      delete 'follow' => 'users#unfollow', :as => 'unfollow'
      post 'follow'
    end
  end
  resource :session, :to => 'user_sessions'
  match '/my_account' => 'users#my_account', :as => 'my_account'
  #match '/auth/facebook/callback' => 'sessions#create'
  #match '/signout' => 'sessions#destroy', :as => :signout

  match '/home/about', :as => 'about'
  match '/home/contact_us', :as => 'contact_us'

  root :to => 'home#index'
end
