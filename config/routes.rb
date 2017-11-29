Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'notes#index'
  resources :notes, only: [:index]
  namespace :users do
    resources :notes
  end
end
