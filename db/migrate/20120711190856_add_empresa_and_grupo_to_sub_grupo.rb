class AddEmpresaAndGrupoToSubGrupo < ActiveRecord::Migration
  def change
    add_column :subgrupos, :empresa, :ssinteger
    add_column :subgrupos, :grupo, :integer
  end
end
