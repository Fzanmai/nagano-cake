Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #会員側のルーティング設定

  scope module: :public do
    resources :customers do
      collection do
        get 'unsubscribe'
        patch 'withdrawal'
      end
    end
    resources :cart_items do
      collection do
        delete 'all_destroy'
      end
    end
    resources :orders do
      collection do
        get 'thanx'
        get 'confirmation'
        post 'confirmation'
      end
    end
    resources :items, only: [:index, :show]
    resources :shipping_addresses
    root to: "homes#top"
    get '/home/about' => 'homes#about', as: 'about'

    get '/search', to: 'searches#search'
  end

  #管理者側のルーティング設定
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :index, :update]
    resources :order_details, only: [:update]
    resources :items, except: [:destry]
    resources :item_genres, only: [:index, :edit, :update, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
