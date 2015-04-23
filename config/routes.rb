Rails.application.routes.draw do
  
  devise_for :users
  root 'welcome#index'

  resources :wikis

  get 'about' => 'welcome#about'
end
