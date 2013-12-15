class PaginasController < ApplicationController
  def ingrese_productos
  	@archivo = Archivo.new
  	@archivo.productos.build
  	@archivo.productos.build
  	@archivo.productos.build
  end

  def guardar_productos
  	@archivo = Archivo.new(params[:archivo].permit!)

  	if @archivo.save
      redirect_to  variables_produccion_path(@archivo.id)
    else
      render action: 'ingrese_productos'
    end
  end

  def variables_produccion
    @archivo = Archivo.find(params[:id])
    @productos = @archivo.productos
  end

  def produccion_diaria
  end

  def costos_totales
  end

  # private
  #   def permit!
  #   each_pair do |key, value|
  #     convert_hashes_to_parameters(key, value)
  #     self[key].permit! if self[key].respond_to? :permit!
  #   end

  #   @permitted = true
  #   self
  #   end
  # end
end
