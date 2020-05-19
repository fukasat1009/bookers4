Rails.application.routes.draw do

    devise_for :users
	root to: "home#index"

    get "home/about" => "home#about"

    resources :users  
    resources :relationships, only: [:create, :destroy]
    
    resources :books do
    resource :book_comments, only: [:create,:destroy]
    resource :favorites, only: [:create, :destroy]


 end
end
