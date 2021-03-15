class OrderChange < ApplicationRecord
  enum status: %i[solicitação_realizada solicitação_respondida etiqueta_gerada produto_devolvido produto_ainda_não_devolvido concluído_cupom enviado concluído_estorno não_aceito]
  enum change_type: %i[não_se_aplica troca devolução troca_promoção]
  enum devolution_type: %i[não_aplica correios retirada_em_mãos_São_Paulo/SP retirada_em_mãos_Porto_Alegre/RS]
end
