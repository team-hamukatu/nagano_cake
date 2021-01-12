Rails.application.routes.draw do

  scope module: :public do
    resource :members, only: [:update]
    # ユーザーの会員状況を更新
    patch "/members/withdraw" => "members#withdraw"
    # ユーザーの会員状況を取得
    get "/members/check" => "members#check"
    get "/members/my_page" => "members#show"
    get "/members/edit" => "members#edit"
  end

  devise_for :administrators
  devise_for :members

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
  end

  scope module: :public do
    resources :items, only: [:index,:show]
  end



  scope module: :public do
    resources :cart_items, only: [:create,:index,:update,:destroy]do
      collection do
        delete 'destroy_all'
      end
    end
  end

  scope module: :public do
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    resources :orders, only: [:new,:create,:index,:show]
  end

  scope module: :public do
    resources :shipping_addresses, only: [:create,:index,:edit,:update,:destroy]
  end

  namespace :admin do
    get "/" => "homes#top"
  end

  namespace :admin do
    resources :items, only: [:new,:create,:index,:show,:edit,:update]
  end

  namespace :admin do
    resources :genres, only: [:create,:index,:edit,:update]
  end

  namespace :admin do
    resources :members, only: [:index,:show,:edit,:update]
  end

  namespace :admin do
    resources :orders, only: [:index,:show,:update]
  end

  namespace :admin do
    patch "admin/order_details/:id" => "orders_details#update"
  end

end
