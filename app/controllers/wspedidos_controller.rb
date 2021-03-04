class WspedidosController < ApplicationController
  def initial_screen; end

  def search_orders
    params.inspect
    order = Wspedido.where(cliente_email: params['email']).where(numero: params['pedidos']).first
    if order.present?
      redirect_to order_change_path, notice: 'Pedido Encontrado.'
    else
      redirect_to inital_screen_path, notice: 'Pedido Não Encontrado.'
    end
  end

  def order_change; end
end
