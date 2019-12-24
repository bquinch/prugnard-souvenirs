Rails.application.routes.draw do
  devise_for :users
  root to: 'souvenirs#index'

  get '/ce-jour-la', to: 'souvenirs#that_day'

  resources :souvenirs, only: [:show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
