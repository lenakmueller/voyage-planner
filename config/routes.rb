Rails.application.routes.draw do
  devise_for :users
  root to: "trips#index"
  resources :trips do
    resources :transportations
    resources :accommodations
    resources :activities
  end
end
