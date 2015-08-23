Rails.application.routes.draw do
  
  resources :wikis
  resources :charges, only: [:new, :create]
  devise_for :users

  
  get 'about' => 'welcome#about'
  get 'upgrade' => 'charges#new'
  get 'downgrade' => 'users#downgrade'
  root to: 'welcome#index'
end