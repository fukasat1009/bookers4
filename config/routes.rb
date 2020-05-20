Rails.application.routes.draw do

    devise_for :users
	root to: "home#index"

    get "home/about" => "home#about"
    get "users/follow_list" => "users#follow_list"
    get "users/follower_list" => "users#follower_list"


    resources :users  
    resources :relationships, only: [:create, :destroy]
    
    resources :books do
    resource :book_comments, only: [:create,:destroy]
    resource :favorites, only: [:create, :destroy]


 end
end
