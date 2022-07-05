Rails.application.routes.draw do
  get 'task/index'
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    resources :tasks
  end
end




















# Rails.application.routes.draw do
#   get 'posts/index'

#   get 'task/index'

#   root 'static_pages#top'
#   get '/signup', to: 'users#new'
  
#   get    '/login', to: 'sessions#new'
#   post   '/login', to: 'sessions#create'
#   delete '/logout', to: 'sessions#destroy'
  
#   resources :users, :tasks
# end

