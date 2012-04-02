class AddEmpresaToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :empresa, :integer
  end
end
