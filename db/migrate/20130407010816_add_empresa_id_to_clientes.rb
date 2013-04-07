class AddEmpresaIdToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :empresa_id, :integer
  end
end
