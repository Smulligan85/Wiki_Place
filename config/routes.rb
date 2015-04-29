Rails.application.routes.draw do
  
  devise_for :users

  resources :wikis do
    resources :collaborations, only: [:create, :destroy] do
      collection do
        post :manage
      end
    end
  end

  resources :charges, only: [:new, :create]

  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'
end
