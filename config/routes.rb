Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # デバイスとしてcustomerを読み込む。
  devise_scope :customer do
    # ゲストログイン用
    post 'public/customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
    # 新規登録画面のエラーメッセージ表示後のリロード時にエラーが起こる問題を解決
    get '/customers' => 'public/registrations#new'
  end

  # 検索用
  get "search" => "searches#search"

  root to: "public/homes#top"

  namespace :admin do
    # admin側では会員一覧画面がトップ画面を兼ねる
    get '/home/top' => 'customers#index'

    resources :floor_plans, only: [:index, :create, :edit, :update]
    resources :property_types, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end


  namespace :public do
    get '/customers/my_page' => 'customers#show', as: 'my_page'
    get '/customers/my_page/edit' => 'customers#edit', as: 'edit'
    patch '/customers' => 'customers#update', as: 'update'
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'

    get 'properties/favorites' => 'favorites#index', as: 'favorites'

    resources :properties do
      resource :favorite, only: [:create, :destroy]
      # destroyするときの挙動によるresources :favorite, only: [:create, :destroy]
    end

  end

end
