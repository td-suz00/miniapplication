Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'comments#index'
  resources :comments
  # get  'comments/new'  =>  'comments#new'
  # post 'comments'  =>  'comments#create'  
  # delete  'comments/:id'  => 'comments#destroy'
  # get  'comments/:id/edit' => 'comments#edit'
  # patch  'comments/:id'       => 'comments#update'
end
