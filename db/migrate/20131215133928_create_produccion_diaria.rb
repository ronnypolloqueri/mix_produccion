class CreateProduccionDiaria < ActiveRecord::Migration
  def change
    create_table :produccion_diaria do |t|
      t.decimal :cantidad
      t.references :producto, index: true

      t.timestamps
    end
  end
end
