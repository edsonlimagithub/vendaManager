class AddColumnsRota < ActiveRecord::Migration
  def up
    add_column :rota, :data, :date
  end

  def down
    remove_column :rota, :data
  end
end
