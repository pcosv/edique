Rails.application.routes.draw do
  resources :post_attachments
  resources :posts
  get 'sessions/new'

#login
  get    '/login',   to: 'sessions#new', as:'login'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'
  get '/denied',to: 'sessions#on_denied',as: 'denied'

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
