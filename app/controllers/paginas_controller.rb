class PaginasController < ApplicationController
  def ingrese_productos
  	@archivo = Archivo.new
  	3.times{ @archivo.productos.build }
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
    @productos.each do |producto|
      variables = ['Mano de Obra', 'Tiempo', 'Insumos']
      variables.each do |nombre_de_variable|
        variable_producto = producto.variables_de_produccion.build
        variable_producto.nombre = nombre_de_variable
      end
    end
  end

  def guardar_variables_produccion
    @archivo = Archivo.find(params[:id])
    if @archivo.update(params[:archivo].permit!)
      redirect_to  produccion_diaria_path(@archivo.id)
    else
      render action: 'variables_produccion'
    end
  end

  def produccion_diaria
    @archivo = Archivo.find(params[:id])
    @productos = @archivo.productos
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
