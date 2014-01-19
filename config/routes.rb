Readonce::Application.routes.draw do
  devise_for :users
  resource :mockup, controller: 'mockup', only: [:index, :show]
  
  root to: 'mockup#index'
  
  resources :messages
end
