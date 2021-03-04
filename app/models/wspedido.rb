class Wspedido < ApplicationRecord
  def self.integrate_orders(host, app_key)
    @order_page = HTTParty.get("#{host}/ws/wspedidos.json",
                               headers: { content: 'application/json',
                                          Appkey: "#{app_key}" })
    (1..@order_page['pagination']['page_count']).each do |i|
      @order_page = HTTParty.get("#{host}/ws/wspedidos.json?page=#{i}",
                                 headers: { content: 'application/json',
                                            Appkey: "#{app_key}" })
      @order_page['result'].each do |order_page|
        begin
          Wspedido.create(id: order_page['Wspedido']["id"],
                          numero: order_page['Wspedido']["numero"].to_i,
                          data_pedido: DateTime.parse(order_page['Wspedido']["data_pedido"]),
                          pedidostatus_id: order_page['Wspedido']["pedidostatus_id"],
                          cliente_tipo: order_page['Wspedido']["cliente_tipo"],
                          cliente_cpfcnpj: order_page['Wspedido']["cliente_cpfcnpj"],
                          cliente_razaosocial: order_page['Wspedido']["cliente_razaosocial"],
                          cliente_ie: order_page['Wspedido']["cliente_ie"],
                          cliente_data_nascimento: order_page['Wspedido']["cliente_data_nascimento"],
                          cliente_logradouro: order_page['Wspedido']["cliente_logradouro"],
                          cliente_numero: order_page['Wspedido']["cliente_numero"],
                          cliente_informacoes_adicionais: order_page['Wspedido']["cliente_informacoes_adicionais"],
                          cliente_bairro: order_page['Wspedido']["cliente_bairro"],
                          cliente_cidade: order_page['Wspedido']["cliente_cidade"],
                          cliente_estado: order_page['Wspedido']["cliente_estado"],
                          cliente_pais: order_page['Wspedido']["cliente_pais"],
                          cliente_cep: order_page['Wspedido']["cliente_cep"],
                          cliente_telefone: order_page['Wspedido']["cliente_telefone"],
                          cliente_telefone_comercial: order_page['Wspedido']["cliente_telefone_comercial"],
                          cliente_celular: order_page['Wspedido']["cliente_celular"],
                          cliente_email: order_page['Wspedido']["cliente_email"],
                          cliente_observacao: order_page['Wspedido']["cliente_observacao"],
                          entrega_cpfcnpj: order_page['Wspedido']["entrega_cpfcnpj"],
                          entrega_razaosocial: order_page['Wspedido']["entrega_razaosocial"],
                          entrega_ie: order_page['Wspedido']["entrega_ie"],
                          entrega_data_nascimento: order_page['Wspedido']["entrega_data_nascimento"],
                          entrega_logradouro: order_page['Wspedido']["entrega_logradouro"],
                          entrega_numero: order_page['Wspedido']["entrega_numero"],
                          entrega_informacoes_adicionais: order_page['Wspedido']["entrega_informacoes_adicionais"],
                          entrega_bairro: order_page['Wspedido']["entrega_bairro"],
                          entrega_cidade: order_page['Wspedido']["entrega_cidade"],
                          entrega_estado: order_page['Wspedido']["entrega_estado"],
                          entrega_pais: order_page['Wspedido']["entrega_pais"],
                          entrega_cep: order_page['Wspedido']["entrega_cep"],
                          entrega_telefone: order_page['Wspedido']["entrega_telefone"],
                          entrega_telefone_comercial: order_page['Wspedido']["entrega_telefone_comercial"],
                          entrega_celular: order_page['Wspedido']["entrega_celular"],
                          entrega_email: order_page['Wspedido']["entrega_email"],
                          envio_prazo: order_page['Wspedido']["envio_prazo"],
                          envio_prazo_descricao: order_page['Wspedido']["envio_prazo_descricao"],
                          entrega_prazo: order_page['Wspedido']["entrega_prazo"],
                          envio_servico_id: order_page['Wspedido']["envio_servico_id"],
                          envio_servico: order_page['Wspedido']["envio_servico"],
                          envio_codigo_objeto: order_page['Wspedido']["envio_codigo_objeto"],
                          pagamento_integrador_id: order_page['Wspedido']["pagamento_integrador_id"],
                          pagamento_forma: order_page['Wspedido']["pagamento_forma"],
                          referencia_venda: order_page['Wspedido']["referencia_venda"],
                          nota_fiscal: order_page['Wspedido']["nota_fiscal"],
                          nota_fiscal_serie: order_page['Wspedido']["nota_fiscal_serie"],
                          nota_fiscal_chave: order_page['Wspedido']["nota_fiscal_chave"],
                          nota_fiscal_data: order_page['Wspedido']["nota_fiscal_data"],
                          total_pedido: order_page['Wspedido']["total_pedido"],
                          desconto_avista: order_page['Wspedido']["desconto_avista"],
                          total_descontos: order_page['Wspedido']["total_descontos"],
                          total_acrescimos: order_page['Wspedido']["total_acrescimos"],
                          total_frete: order_page['Wspedido']["total_frete"],
                          total_produtos: order_page['Wspedido']["total_produtos"],
                          total_peso: order_page['Wspedido']["total_peso"],
                          url_rastreamento: order_page['Wspedido']["url_rastreamento"])
        rescue ArgumentError
          puts 'erro'
        end
      end
    end
  end
end
