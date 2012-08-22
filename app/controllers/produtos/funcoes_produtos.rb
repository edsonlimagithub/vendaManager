class FunctionsProduct
  def self.addAmountStockInternal product_id, amount
    product = Produto.find(product_id)
    product.estoque_interno += amount
    product.save
  end
  
  def self.decreaseAmountStockInternal product_id, amount
    product = Produto.find(product_id)
    product.estoque_interno += amount
    product.save
  end
  
  def self.addAmountStockExternal product_id, amount
    product = Produto.find(product_id)
    product.estoque_externo += amount
    product.save
  end
  
  def self.decreaseAmountStockInternal product_id, amount
    product = Produto.find(product_id)
    product.estoque_externo += amount
    product.save
  end
end