Rails.application.routes.draw do
 root  'static_pages#home'

 get    'login',   to:'sessions#new'
 post   'login',   to:'sessions#create'  
 delete 'logout',  to:'sessions#destroy'

 get  'signup',          to:'users#new'
 get  'users/:id/show',  to:'users#show'
 post 'users/create',    to:'users#create'
 get  'users/:id/edit',  to:'users#edit'
 patch 'users/:id/update',to:'users#update'
 
 get  'posts/new',         to:'posts#new'
 get  'posts/:id/show',    to:'posts#show'
 post 'posts/create',      to:'posts#create'
 delete 'posts/:id/destroy', to:'posts#destroy'

end
