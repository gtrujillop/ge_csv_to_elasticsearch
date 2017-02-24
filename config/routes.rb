Rails.application.routes.draw do
  root 'csv_processors#new'
  resources :csv_processors, only: [:new, :create]
end
