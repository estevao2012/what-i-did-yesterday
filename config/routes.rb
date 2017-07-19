Rails.application.routes.draw do
  resources :remember_notes


  root "remember_notes#index"


end
