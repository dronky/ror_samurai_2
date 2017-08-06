Rails.application.routes.draw do

  resources :trains
  resources :railway_stations
  resources :routes
  resources :tickets
  resources :wagons
  # пришлось добавить эти строчки, в противном случае была ошибка "undefined method `sv_wagon_path'"
  resources :sv_wagons, controller: 'wagons'
  resources :sit_wagons, controller: 'wagons'
  resources :coupe_wagons, controller: 'wagons'
  resources :plackart_wagons, controller: 'wagons'



  # root 'trains#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
