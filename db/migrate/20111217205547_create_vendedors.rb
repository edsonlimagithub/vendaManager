class CreateVendedors < ActiveRecord::Migration
  def change
    create_table :vendedors do |t|
      t.string :nome
      t.string :telefone1
      t.string :telefone2
      t.binary :desativado
      t.string :logradouro
      t.string :caixa_postal
      t.string :bairro
      t.string :cidade
      t.string :uf

      t.timestamps
    end
  end
end
