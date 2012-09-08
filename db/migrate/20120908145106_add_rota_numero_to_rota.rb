class AddRotaNumeroToRota < ActiveRecord::Migration
  def change
    add_column :rota, :rota_numero, :integer
  end
end
