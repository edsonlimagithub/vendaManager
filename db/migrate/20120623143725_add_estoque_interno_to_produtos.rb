class AddEstoqueInternoToProdutos < ActiveRecord::Migration
  def change
    add_column :produtos, :estoque_interno, :float
  end
end
