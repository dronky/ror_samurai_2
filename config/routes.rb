Rails.application.routes.draw do

  devise_for :users, :controllers => {
      :sessions => 'my_devise/sessions'
  }

  devise_scope :user do
    authenticated :user do
      root to: 'search#index'
    end
    unauthenticated :user do
      root to: 'my_devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :tickets
  resources :search

  namespace :admin do

    root 'base#index'
    resources :wagons

    resources :trains do
      resources :wagons
    end

    resources :railway_stations do
      patch :update_position, on: :member
    end
    resources :routes
    resources :users
    resources :tickets

    resources :coupe_wagons, :controller => "wagons", :type => "CoupeWagon"
    resources :plackart_wagons, :controller => "wagons", :type => "PlackartWagon"
    resources :sv_wagons, :controller => "wagons", :type => "SvWagons"
    resources :sit_wagons, :controller => "wagons", :type => "SitWagon"

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
