class FunctionProducts
  def addAmountStockInternal product_id, amount
    product = Produto.find(product_id)
    product.estoque_interno += amount
    product.save
  end
  
  def decreaseAmountStockInternal product_id, amount
    product = Produto.find(product_id)
    product.estoque_interno += amount
    product.save
  end
  
  def addAmountStockExternal product_id, amount
    product = Produto.find(product_id)
    product.estoque_externo += amount
    product.save
  end
  
  def decreaseAmountStockEnternal product_id, amount
    product = Produto.find(product_id)
    product.estoque_externo += amount
    product.save
  end
end