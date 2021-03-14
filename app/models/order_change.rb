class OrderChange < ApplicationRecord
  enum status: %i[solicitação_realizada solicitação_respondida etiqueta_gerada produto_devolvido produto_ainda_não_devolvido concluído_cupom enviado concluído_estorno não_aceito]
end
