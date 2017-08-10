Rails.application.routes.draw do

  resources :trains do
    resources :wagons
    resources :sv_wagons, controller: 'wagons'
    resources :sit_wagons, controller: 'wagons'
    resources :coupe_wagons, controller: 'wagons'
    resources :plackart_wagons, controller: 'wagons'
  end
  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes
  resources :tickets
  # resources :wagons закоментированно, т.к. для вагонов сделан вложенный ресурс
  resources :sv_wagons, controller: 'wagons'
  resources :sit_wagons, controller: 'wagons'
  resources :coupe_wagons, controller: 'wagons'
  resources :plackart_wagons, controller: 'wagons'

  # root 'trains#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
