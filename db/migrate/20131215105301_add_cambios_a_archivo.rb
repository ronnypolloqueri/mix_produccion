class AddCambiosAArchivo < ActiveRecord::Migration
  def change
  	rename_column :archivos, :num_productos, :num_de_dias
  end
end
