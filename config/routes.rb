Rails.application.routes.draw do

  devise_for :administrators
  devise_for :members
  
  namespace :public do
    get 'shipping_addresses/index'
    get 'shipping_addresses/create'
    get 'shipping_addresses/edit'
    get 'shipping_addresses/update'
    get 'shipping_addresses/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/create'
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
  end
  namespace :public do
    get 'members/show'
    get 'members/edit'
    get 'members/update'
    get 'members/withdraw'
    get 'members/check'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
 　
    namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/new'
    get 'items/index'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
