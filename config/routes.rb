Rails.application.routes.draw do
  namespace :admin do
    get 'admin/index'
  end

  root 'home_pages#index'
  namespace :admin do
    root "admin#index"
  end

end
