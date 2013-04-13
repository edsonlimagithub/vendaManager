class RenClientesEmpresaToEmpresaId < ActiveRecord::Migration
  def up
    rename_column :clientes, :empresa, :empresa_id
  end

  def down
   rename_column :clientes, :empresa_id, :empresa
  end
end
