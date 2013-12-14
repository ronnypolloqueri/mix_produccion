class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :nombre
      t.references :archivo, index: true

      t.timestamps
    end
  end
end
