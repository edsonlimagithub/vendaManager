class FunctionsProduct
  
  def self.addAmountStockInternal product_id, amount
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
  
  def self.decreaseAmountStockExternal product_id, amount
    product = Produto.find(product_id)
    if product.estoque_externo.nil?
      product.estoque_externo = 0
    end
    product.estoque_externo -= amount
    product.save
  end
  
  def self.transferProductInternalToExternal product_id, amount
    decreaseAmountStockInternal product_id, amount
    addAmountStockExternal product_id, amount
  end
  
  def self.transferProductExternalToInternal product_id, amount
    decreaseAmountStockExternal product_id, amount
    addAmountStockInternal product_id, amount
  end
  
  def self.transferKitInternalToExternal kit_id, amount
    itemKit = ItemKit.find(:all, :conditions => ["kit_id = ?", kit_id])
    itemKit.each do |item|
      transferProductInternalToExternal item[:produto_id], item[:quantidade] * amount.to_f
    end
  end
  
  def self.transferKitExternalToInternal kit_id, amount
    itemKit = ItemKit.find(:all, :conditions => ["kit_id = ?", kit_id])
    itemKit.each do |item|
       #abort item.inspect
      FunctionsProduct.transferProductExternalToInternal item[:produto_id], item[:quantidade] * amount.to_f
    end
  end
  
  private 
  
  
end