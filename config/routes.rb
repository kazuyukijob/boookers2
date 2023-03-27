Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 devise_for :users
 root to: 'homes#top'
   get 'home/about' => 'homes#about'


 resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
 resources :users, only: [:show, :edit, :update, :index]

end
