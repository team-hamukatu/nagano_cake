Rails.application.routes.draw do

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
    resource :members, only: [:show,:edit,:update]
    patch "/members/withdraw" => "members#withdraw"
    get "/members/check" => "members#check"
  end

  scope module: :public do
    resources :cart_items, only: [:create,:index,:update,:destroy]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
  end
  
  scope module: :public do
    resources :orders, only: [:new,:create,:index,:show]
    post "orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
  end
 
  scope module: :public do
    resources :shipping_addresses, only: [:create,:index,:edit,:update,:destroy]
  end
  
  namespace :admin do
    get "/admin" => "homes#about"
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
