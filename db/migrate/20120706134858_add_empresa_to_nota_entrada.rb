class AddEmpresaToNotaEntrada < ActiveRecord::Migration
  def change
    add_column :nota_entradas, :empresa, :integer
  end
end
