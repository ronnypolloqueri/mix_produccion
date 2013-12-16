class PaginasController < ApplicationController

  def index
    @archivos = Archivo.all
  end

  def buscar
    @archivos = Archivo.where("nombre LIKE '%#{params[:nombre]}%'")
  end

  def ingrese_productos
  	@archivo = Archivo.new
  	3.times{ @archivo.productos.build }
  end

  def edit_ingrese_productos
    @archivo = Archivo.find(params[:id])
  end

  def update_ingrese_productos
    @archivo = Archivo.find(params[:id])
    @archivo.update(params[:archivo].permit!)
    redirect_to root_path
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

  def edit_variables_produccion
    @archivo = Archivo.find(params[:id])
    @productos = @archivo.productos
  end

  def update_variables_produccion
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
    @num_de_productos = @productos.size
    @numero_de_dias = @archivo.num_de_dias
    @productos.each do |producto|
      @numero_de_dias.times{ producto.produccion_diaria.build }
    end
  end

  def edit_produccion_diaria
    @archivo = Archivo.find(params[:id])
    @productos = @archivo.productos
    @num_de_productos = @productos.size
    @numero_de_dias = @archivo.num_de_dias
    # @productos.each do |producto|
    #   @numero_de_dias.times{ producto.produccion_diaria.build }
    # end
  end

  def produccion_diaria_aleatoria
    @archivo = Archivo.find(params[:id])
    @media = params[:media].to_i if params[:media]
    @productos = @archivo.productos
    @num_de_productos = @productos.size
    @numero_de_dias = @archivo.num_de_dias
    @productos.each do |producto|
      @numero_de_dias.times{ producto.produccion_diaria.build }
    end
  end

  def update_produccion_diaria
    @archivo = Archivo.find(params[:id])
    if @archivo.update(params[:archivo].permit!)
      redirect_to  costos_totales_path(@archivo.id)
    else
      render action: 'produccion_diaria'
    end
  end

  def costos_totales
    @archivo = Archivo.find(params[:id])

    @productos = @archivo.productos
    # vamos a hacer una matriz de presentacion
    #  la fila será un hash {nombre:producto, array: [12,23,23,..(cantidades)]}
    @matriz = @archivo.resolver

  end

  def destroy
    @archivo = Archivo.find(params[:id])
    @archivo.destroy
    redirect_to root_path
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
