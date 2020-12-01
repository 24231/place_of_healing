Rails.application.routes.draw do
 root  'static_pages#home'

 get 'login',    to:'sessions#new'
 post 'login',   to:'sessions#create'  
 delete 'logout',to:'sessions#destroy'

 get 'users/:id/show', to:'users#show'
 get 'signup',         to:'users#new'
 post 'users/create',  to:'users#create'
 
  
end
