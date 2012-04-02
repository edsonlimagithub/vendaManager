class CreateFornecedors < ActiveRecord::Migration
  def change
    create_table :fornecedors do |t|
      t.string :descricao
      t.string :logradouro
      t.string :end_numero
      t.string :complemento
      t.string :telefone1
      t.string :telefone
      t.string :cidade

      t.timestamps
    end
  end
end
