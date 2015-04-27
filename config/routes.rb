


Rails.application.routes.draw do
  
  devise_for :users

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'

  resources :wikis do
    resources :collaborators
  end

  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'
end
