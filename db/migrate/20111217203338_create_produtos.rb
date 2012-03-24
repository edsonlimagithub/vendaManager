class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :descricao
      t.integer :grupo_id
      t.integer :subgrupo_id
      t.float :preco_compra
      t.float :preco_venda
      t.binary :desativado

      t.timestamps
    end
  end
end
