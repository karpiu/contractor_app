Rails.application.routes.draw do
  resources :payment_requests

  root to: 'payment_requests#index'
end
