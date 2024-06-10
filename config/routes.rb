Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update] do
    get "search" => "users#search"
  end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html