class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :rg
      t.string :logradouro
      t.string :caixa_postal
      t.string :cidade
      t.string :bairro
      t.string :uf
      t.string :telefone1
      t.string :telefone2
      t.binary :desativado

      t.timestamps
    end
  end
end
