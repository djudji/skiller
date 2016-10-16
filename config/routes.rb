Rails.application.routes.draw do
  resources :reviews
  resources :places
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
end
