class AddEmpresaToProduto < ActiveRecord::Migration
  def change
    add_column :produtos, :empresa, :integer
  end
end
