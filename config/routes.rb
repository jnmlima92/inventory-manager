Rails.application.routes.draw do
  get 'merchandise_receipts/index'
  get 'merchandise_receipts/show'
  get 'merchandise_receipts/create'
  resources :inventory
end
