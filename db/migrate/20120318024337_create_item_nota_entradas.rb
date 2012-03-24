class CreateItemNotaEntradas < ActiveRecord::Migration
  def change
    create_table :item_nota_entradas do |t|
      t.integer :produto
      t.integer :nota
      t.float :quantidade
      t.float :valor_unitario
      t.float :quantidade

      t.timestamps
    end
  end
end
