Rails.application.routes.draw do
  resources :users
  #resources :tasks
  resources :projects, :path => '/' do
    resources :tasks do
   		post '/addMemberTask/:uid' => 'tasks#addMemberTask', as: 'addMemberTask'
    end
    post '/addMember/:uid' => 'projects#addMember', as: 'addMember'
  end

  # root to '#projects#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
