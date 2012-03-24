class CreateNotaEntradas < ActiveRecord::Migration
  def change
    create_table :nota_entradas do |t|
      t.string :numero
      t.date :data_emissao
      t.date :data_entrada
      t.integer :fornecedor
      t.float :valor_produtos
      t.float :valor_despesas
      t.float :valor_total
      t.integer :filial

      t.timestamps
    end
  end
end
