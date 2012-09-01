class AddAtivaToRota < ActiveRecord::Migration
  def change
    add_column :rota, :inativa, :boolean
  end
end
