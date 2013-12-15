class CreateVariablesDeProduccion < ActiveRecord::Migration
  def change
    create_table :variables_de_produccion do |t|
      t.string :nombre
      t.references :producto, index: true
      t.decimal :valor

      t.timestamps
    end
  end
end
