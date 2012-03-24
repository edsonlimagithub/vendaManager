class CreateItemKits < ActiveRecord::Migration
  def change
    create_table :item_kits do |t|
      t.integer :produto_id
      t.integer :kit_id
      t.float :quantidade

      t.timestamps
    end
  end
end
