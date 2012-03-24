class CreateConsignados < ActiveRecord::Migration
  def change
    create_table :consignados do |t|
      t.integer :cliente_id
      t.datetime :data
      t.datetime :proxima_cobranca
      t.integer :prazo_dias

      t.timestamps
    end
  end
end
