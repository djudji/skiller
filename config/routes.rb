Rails.application.routes.draw do
  resources :places
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
end
