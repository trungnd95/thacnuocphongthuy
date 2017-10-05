Rails.application.routes.draw do
  devise_for :admins , controllers: {
        sessions: 'devise_admins/sessions'
      }

  namespace :admin do
    get 'admin/index'
  end

  root 'home_pages#index'
  namespace :admin do
    root "admin#index"
  end

end
