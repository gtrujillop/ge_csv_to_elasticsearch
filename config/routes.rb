Rails.application.routes.draw do
  root 'csv_records_ges#new'
  resources :csv_records_ges, only: [:new, :create]
end
