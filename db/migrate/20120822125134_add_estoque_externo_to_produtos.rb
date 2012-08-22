class AddEstoqueExternoToProdutos < ActiveRecord::Migration
  def change
    add_column :produtos, :estoque_externo, :float
  end
end
