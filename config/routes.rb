Rails.application.routes.draw do
  devise_for :admins , controllers: {
        sessions: 'devise_admins/sessions'
      }
  namespace :admin do
    root 'admin#index'
    resources :categories
  end
  root 'home_pages#index'
end
