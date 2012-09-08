require 'produtos/funcoes_produtos'
class ProcessaRota
  def self.retorno parametros
    parametros.each do |key, value|
      chave = key.split("_")
      if value != ""
        if chave[0] == 'kit'
          FunctionsProduct.transferKitExternalToInternal chave[1].to_i, value.to_f
          updateAmountItemKit chave[1].to_i, value.to_f 
        end
        if chave[0] == 'brinde'
          rotaItem = RotaItem.find(chave[1].to_i)
          FunctionsProduct.transferProductExternalToInternal rotaItem.item_id, value.to_f
          updateAmountItemKit chave[1].to_i, value.to_f 
        end
      end
    end      
  end
  
private  
  def self.updateAmountItemKit itemkit_id, amount
    rotaItem = RotaItem.find(itemkit_id)
    rotaItem.quantidade -= amount.to_f
    rotaItem.save
  end
end