class AddValorVendaToKits < ActiveRecord::Migration
  def change
    add_column :kits, :preco_venda, :float
  end
end
