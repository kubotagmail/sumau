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
  
  root to: "public/homes#top"
  
  namespace :admin do
    get '/admin' => 'homes#top'
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
    resources :properties do
      resources :favorite, only: [:index, :create, :destroy]
    end
  end
  
end
