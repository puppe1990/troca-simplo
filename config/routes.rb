Rails.application.routes.draw do
  get '/order', to: 'wspedidos#initial_screen', as: 'inital_screen'
  post '/search_orders', to: 'wspedidos#search_orders', as: 'search_orders'
  get '/order_change', to: 'wspedidos#order_change', as: 'order_change'
  root to: 'wspedidos#initial_screen'
end
