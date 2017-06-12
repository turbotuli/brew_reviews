Rails.application.routes.draw do
  root 'brews#index'
  devise_for :users
  resources :brews

end
