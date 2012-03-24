class CreateSubgrupos < ActiveRecord::Migration
  def change
    create_table :subgrupos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
