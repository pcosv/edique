Rails.application.routes.draw do
  resources :users
  #resources :tasks
  resources :projects do
    resources :tasks
    post '/invite/:uid' => 'project#invite', as: 'invite'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
