class AddBrindeToBrinde < ActiveRecord::Migration
  def change
    add_column :produtos, :brinde, :boolean
  end
end
