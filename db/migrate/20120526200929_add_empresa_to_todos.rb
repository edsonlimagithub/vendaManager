class AddEmpresaToTodos < ActiveRecord::Migration
  def change
    add_column :cidades, :empresa, :integer
    add_column :clientes, :empresa, :integer
    add_column :consignados, :empresa, :integer
    add_column :fornecedors, :empresa, :integer
    add_column :grupos, :empresa, :integer
    add_column :item_consignados, :empresa, :integer
    add_column :item_kits, :empresa, :integer
    add_column :item_nota_entradas, :empresa, :integer
    add_column :kits, :empresa, :integer
    add_column :nota_entradas, :empresa, :integer
    add_column :produtos, :empresa, :integer
    add_column :rota, :empresa, :integer
    add_column :rota_items, :empresa, :integer
    add_column :subgrupos, :empresa, :integer
    add_column :usuarios, :empresa, :integer
    add_column :vendedors, :empresa, :integer
  end
end
