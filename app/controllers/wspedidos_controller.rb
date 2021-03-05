class WspedidosController < ApplicationController
  def initial_screen; end

  def search_orders
    order = Wspedido.where(cliente_cpfcnpj: params['cpf'].delete('.-'))
                    .where(numero: params['pedido'])
                    .where(pedidostatus_id: [23, 3, 29])
                    .first
    if order.present?
      redirect_to order_change_path(cpf: params['cpf'].delete('.-'), pedido: params['pedido']), notice: 'Pedido Encontrado.'
    else
      redirect_to inital_screen_path, notice: 'Pedido Não Encontrado.'
    end
  end

  def order_change
    @order = Wspedido.where(cliente_cpfcnpj: params['cpf']).where(numero: params['pedido']).first
    @items = Item.where(pedido_id: @order.id)
  end

  def generate_order_change; end
end
