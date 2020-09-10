Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :destroy]
end


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmlz