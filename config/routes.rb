Rails.application.routes.draw do
  get 'images/delete'

  devise_for :admins , controllers: {
        sessions: 'devise_admins/sessions'
      }
  namespace :admin do
    root 'admin#index'
    resources :categories
    resources :items
    resources :images, only: [:destroy]
  end
  root 'home_pages#index'
  resources :categories, only: :show do
    member do
      get 'filter'
    end
  end
  resources :items, only: :show
  resources :carts, only: :index
end
