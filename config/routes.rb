Rails.application.routes.draw do
  devise_for :users
 resources :packages
 root 'welcomes#index'
end
