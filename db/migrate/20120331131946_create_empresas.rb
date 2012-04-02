class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :razao
      t.string :fantasia
      t.string :telefone1
      t.string :telefone2
      t.string :logradouro
      t.string :end_numero
      t.string :complemento
      t.string :cidade
      t.string :estado
      t.string :contato

      t.timestamps
    end
  end
end
