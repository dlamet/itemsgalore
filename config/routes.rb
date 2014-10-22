Rails.application.routes.draw do

  resources :items

  resources :merchants

  resources :purchasers

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  resources :import_files

  resources :items do
    collection do
      get 'import'
    end
  end

  root 'items#index'

end
