Rails.application.routes.draw do
  devise_for :users
  get '/order', to: 'wspedidos#initial_screen', as: 'inital_screen'
  post '/search_orders', to: 'wspedidos#search_orders', as: 'search_orders'
  get '/order_change/:pedido/:cpf', to: 'wspedidos#order_change', as: 'order_change'
  post '/generate_order_change', to: 'wspedidos#generate_order_change', as: 'generate_order_change'
  root to: 'wspedidos#initial_screen'
end
