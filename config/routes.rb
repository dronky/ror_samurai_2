Rails.application.routes.draw do
  resources :trains
  resources :railway_stations

  root 'trains#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
