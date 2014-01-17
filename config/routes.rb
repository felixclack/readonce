Readonce::Application.routes.draw do
  resource :mockup, controller: 'mockup', only: [:index, :show]
  
  root to: 'mockup#index'
end
