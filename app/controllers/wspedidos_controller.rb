class WspedidosController < ApplicationController
  skip_before_action :authenticate_user!, :verify_authenticity_token

  def initial_screen; end

  def search_orders
    order = Wspedido.where(cliente_cpfcnpj: params['cpf'].delete('.-'))
                    .where(numero: params['pedido'])
                    .where(pedidostatus_id: [23, 3, 29])
                    .first
    order_change = OrderChange.find_by(order_id: params['pedido'])
    if order_change.present?
      redirect_to inital_screen_path, notice: 'Solicitação de troca já realizada.'
    elsif order.present?
      redirect_to order_change_view_path(cpf: params['cpf'].delete('.-'), pedido: params['pedido']),
                  notice: 'Pedido Encontrado.'
    else
      redirect_to inital_screen_path, notice: 'Pedido Não Encontrado.'
    end
  end

  def order_change
    @order = Wspedido.where(cliente_cpfcnpj: params['cpf']).where(numero: params['pedido']).first
    @items = Item.where(pedido_id: @order.id)
  end

  def generate_order_change
    wspedido = Wspedido.find(params['order_id'].to_i)
    order_change = OrderChange.new(description: params['change']['description'],
                                   email: wspedido.cliente_email,
                                   full_address: "Endereço: #{wspedido.entrega_logradouro}, #{wspedido.entrega_numero}, #{wspedido.entrega_informacoes_adicionais}, CEP: #{wspedido.entrega_cep}, Bairro: #{wspedido.entrega_bairro}, Cidade: #{wspedido.entrega_cidade}, Estado: #{wspedido.entrega_estado}",
                                   client_name: wspedido.cliente_razaosocial,
                                   phone: wspedido.cliente_telefone,
                                   change_type: params['change']['change_type'],
                                   devolution_type: params['change']['devolution_type'],
                                   order_id: wspedido.numero)
    clothes = []
    params['order_change'].each do |oc|
      if oc.second == '1'
        item = Item.find_by(item_id: oc.first)
        clothes.append("#{item.nome_produto}, #{item.sku}, Valor: #{item.valor_total}, Quantidade: #{item.quantidade}")
      end
    end
    order_change.clothes = clothes
    redirect_to change_order_saved_path(id: order_change.id), notice: 'Solitação salva com sucesso.' if order_change.save
  end

  def change_order_saved
    @order_change = OrderChange.find(params['id'].to_i)
  end

  def webhook_data
    @pedido = Wspedido.find_by(id: params['Wspedido']['id'].to_i)
    if @pedido.present?
      if @pedido.pedidostatus_id != params['Wspedido']['pedidostatus_id']
        @pedido.update(pedidostatus_id: params['Wspedido']['pedidostatus_id'])
        render json: @pedido
      else
        render json: { 'updated': 'nothing to change' }
      end
    else
      @wspedido = Wspedido.webhook_save(params)
      render json: @wspedido
    end
  end
  
  def index
    @status_code = {'Seu pedido foi criado com sucesso! Aguardamos o pagamento' => '1', 
      'Aguardando Pagamento' => '24',
      'Solicitação de troca ou devolução' => '29',
      'Pago' => '2',
      'Pedidos do sul,  SEM ESTOQUE' => '31',
      'Fabricação' => '30',
      'Agendado para entrega pelo motoboy!' => '33',
      'Retirar em mãos Porto Alegre' => '32',
      'Enviado' => '23',
      'Entregue' => '3',
      'Cancelado' => '4',
      'Pedidos impressos São Paulo' => '35',
      'Pedidos impressos Porto Alegre' => '36',
      'Pedido pronta entrega! Imprimir e Embalagem ' => '34',
      'Agendado para entrega pelo motoboy! ' => '33',
      'Pedido bate-volta ' => '37'
    }
  end
end
