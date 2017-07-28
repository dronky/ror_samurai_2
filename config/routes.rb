Rails.application.routes.draw do
  get 'wagon/index'

  get 'wagon/edit'

  get 'wagon/new'

  get 'wagon/show'

  get 'users/index'

  get 'tickets/index'

  resources :trains
  resources :railway_stations
  resources :routes
  resources :tickets

  # root 'trains#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
