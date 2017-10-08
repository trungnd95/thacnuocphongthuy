Rails.application.routes.draw do
  namespace :admin do
    get 'categories/index'
  end

  namespace :admin do
    get 'categories/new'
  end

  namespace :admin do
    get 'categories/create'
  end

  namespace :admin do
    get 'categories/update'
  end

  namespace :admin do
    get 'categories/delete'
  end

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
