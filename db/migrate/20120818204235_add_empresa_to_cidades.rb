class AddEmpresaToCidades < ActiveRecord::Migration
  def change
    add_column :cidades, :empresa, :integer
  end
end
