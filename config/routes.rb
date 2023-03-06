Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :trips do
    resources :transportations
    resources :accommodations
    resources :activities
  end
end
