Rails.application.routes.draw do
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'homes#top'
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  get 'home/about' => 'homes#about'
  get "search" => "searches#search"


 resources :users, only: [:show, :edit, :update, :index]
 resources :books, only: [:create, :index, :show, :destroy, :edit, :updatey] do
 resource :favorites, only: [:create, :destroy]
 resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only:[:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
end
