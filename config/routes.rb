Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "static#dashboard"
  get 'people/:id', to: 'static#person', as: 'people'
  resources :expenses, except: [:index, :destroy, :edit]
  resources :user_expenses, only: [:edit, :update]
end
