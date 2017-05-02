Rails.application.routes.draw do

  namespace 'admin' do
    resources :tours
    resources :users

  	root 'connexions#new'

    get 'log_in' => "connexions#new", :as => "log_in"
    get 'log_out' => "connexions#destroy", :as => "log_out"
    get 'validation1' => "votes#validation1", :as => "validation1"
    get 'validation2' => "votes#validation2", :as => "validation2"
    get 'filter' => "votes#filter", :as => "filter"


  	resources :admins
    resources :connexions
    resources :candidates
    resources :votes

  end


  root 'candidates#index'
  root 'users#edit'

  resources :users
  resources :candidates
  resources :sessions
  resources :votes



  get 'sessions/new'
  get 'log_out' => "sessions#destroy", :as => "log_out"
  get 'log_in' => "sessions#new", :as => "log_in"
  get 'sign_up' => "users#new", :as => "sign_up"
  get 'election' => "candidates#vote", :as => "election"
  get 'filter' => "votes#filter", :as => "filter"




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
