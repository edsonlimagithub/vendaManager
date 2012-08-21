class AddDataRotornoToRota < ActiveRecord::Migration
  def change
    add_column :rota, :data_retorno, :date
  end
end
