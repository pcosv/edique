Rails.application.routes.draw do
  get 'sessions/new'

#login
  get    '/login',   to: 'sessions#new', as:'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as: 'logout'

  resources :users
  #resources :tasks
  resources :projects, :path => '/' do
    resources :tasks do
   		post '/member/:uid' => 'tasks#add_member_to_task', as: 'add_member'
    end
    post '/add_member/:uid' => 'projects#add_member', as: 'add_member'
    post '/finish' => 'projects#finish_project', as: 'finish'
    get '/report' => 'projects#get_report', as: 'report'
  end

  # root to '#projects#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
