class FunctionsProduct
  
  def addAmountStockInternal product_id, amount
    product = Produto.find(product_id)
    if product.estoque_interno.nil?
      product.estoque_interno = 0
    end
    product.estoque_interno += amount
    product.save
  end
  
  def decreaseAmountStockInternal product_id, amount
    product = Produto.find(product_id)
    if product.estoque_interno.nil?
      product.estoque_interno = 0
    end
    product.estoque_interno -= amount
    product.save
  end
  
  def addAmountStockExternal product_id, amount
    product = Produto.find(product_id)
    if product.estoque_externo.nil?
      product.estoque_externo = 0
    end
    product.estoque_externo += amount
    product.save
  end
  
  def decreaseAmountStockExternal product_id, amount
    product = Produto.find(product_id)
    if product.estoque_externo.nil?
      product.estoque_externo = 0
    end
    product.estoque_externo -= amount
    product.save
  end
  
  private 
  
  def changeCampNilToNumber campo
    
  end
  
end