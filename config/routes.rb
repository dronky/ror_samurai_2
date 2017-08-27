Rails.application.routes.draw do

  devise_for :users

  resources :trains do
    resources :wagons
  end

  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes
  resources :tickets
  resources :users

  resources :coupe_wagons,     :controller => "wagons", :type => "CoupeWagon"
  resources :plackart_wagons, :controller => "wagons", :type => "PlackartWagon"
  resources :sv_wagons,        :controller => "wagons", :type => "SvWagons"
  resources :sit_wagons,     :controller => "wagons", :type => "SitWagon"

  resources :search

  root 'trains#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
