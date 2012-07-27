class AddEmpresaToFornecedors < ActiveRecord::Migration
  def change
    add_column :fornecedors, :empresa, :integer
  end
end
