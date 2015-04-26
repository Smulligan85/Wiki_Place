Rails.application.routes.draw do
  
  devise_for :users
  root 'welcome#index'

  resources :wikis

  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'
end
