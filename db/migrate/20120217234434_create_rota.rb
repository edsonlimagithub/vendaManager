class CreateRota < ActiveRecord::Migration
  def change
    create_table :rota do |t|
      t.integer :cidade_id
      t.integer :vendedor_id
      t.string :observacao

      t.timestamps
    end
  end
end
