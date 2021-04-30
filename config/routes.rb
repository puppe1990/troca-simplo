require 'sidekiq/web'

Rails.application.routes.draw do
  resources :order_changes
  devise_for :users
  devise_scope :user do
    get 'admin', to: 'devise/sessions#new'
  end
  get '/order', to: 'wspedidos#initial_screen', as: 'initial_screen'
  get '/wspedidos', to: 'wspedidos#index', as: 'index'
  post '/search_orders', to: 'wspedidos#search_orders', as: 'search_orders'
  get '/order_change/:pedido/:cpf', to: 'wspedidos#order_change', as: 'order_change_view'
  post '/generate_order_change', to: 'wspedidos#generate_order_change', as: 'generate_order_change'
  get '/change_order_saved/:id', to: 'wspedidos#change_order_saved', as: 'change_order_saved'
  post '/api/simplo7', to: 'wspedidos#webhook_data', as: 'webhook_data'
  root to: 'wspedidos#initial_screen'
end
