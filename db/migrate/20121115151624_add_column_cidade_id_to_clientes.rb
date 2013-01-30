class AddColumnCidadeIdToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :cidade_id, :integer
  end
end
