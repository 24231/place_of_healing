Rails.application.routes.draw do
 root  'static_pages#home'

  # resources:users
 get 'users/:id/show', to:'users#show'
 get 'signup',         to:'users#new'
 post 'users/create',  to:'users#create'
  
  
  
end
