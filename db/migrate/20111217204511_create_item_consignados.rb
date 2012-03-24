class CreateItemConsignados < ActiveRecord::Migration
  def change
    create_table :item_consignados do |t|
      t.integer :produto_id
      t.integer :consignado_id
      t.float :quantidade_produto
      t.float :quantidade_kit
      t.integer :kit_id
      t.binary :cobrado

      t.timestamps
    end
  end
end
