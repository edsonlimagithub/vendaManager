class CreateRotaItems < ActiveRecord::Migration
  def change
    create_table :rota_items do |t|
      t.integer :rota_id
      t.integer :item_id
      t.float :quantidade
      t.integer :tipo_item

      t.timestamps
    end
  end
end
