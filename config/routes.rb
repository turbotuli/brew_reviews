Rails.application.routes.draw do
  devise_for :users
  root 'brews#index'

end
