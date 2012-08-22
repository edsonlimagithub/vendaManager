class AddQuantidadeRetornoToRotaItem < ActiveRecord::Migration
  def change
    add_column :rota_items, :quantidade_retorno, :float
  end
end
