class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.string :nombre
      t.integer :num_productos

      t.timestamps
    end
  end
end
