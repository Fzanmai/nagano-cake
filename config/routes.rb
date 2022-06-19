Rails.application.routes.draw do

  namespace :public do
    get 'homes/top'
  end
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #会員側のルーティング設定

  resources :customers, only: [:show, :edit, :update]

  resources :items, only: [:index,:show]


  #管理者側のルーティング設定
  namespace :admin do
  resources :customers, only: [:index, :show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
