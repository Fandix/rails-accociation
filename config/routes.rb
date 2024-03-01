Rails.application.routes.draw do
  resources :authors do
    resources :books
  end

  resources :users do
    resources :products
  end
end
