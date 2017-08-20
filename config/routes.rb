Rails.application.routes.draw do

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




  resource :search, only: [:new, :show, :edit]

  # root 'trains#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
