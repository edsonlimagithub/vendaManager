class CreateEstoques < ActiveRecord::Migration
  def change
    create_table :estoques do |t|
      t.integer :empresa
      t.float :deposito
      t.float :externo

      t.timestamps
    end
  end
end
