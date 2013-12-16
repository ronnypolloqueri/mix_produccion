module PaginasHelper
	# def genera_aleatorios_con_exponencial(filas, columnas)
	# 	# Creando matriz con sus valores en nil
	# 	matriz = []
	# 	fila = Array.new(columnas)
	# 	filas.times{ matriz << fila.clone}

	# 	filas.times do |f|
	# 		columnas.times do |c|
	# 			matriz[f][c] = get_aleatorio_exponencial(10) # la media es 10
	# 		end
	# 	end

	# 	matriz
	# end

	def get_aleatorio_exponencial(media)
		(-1) * media * Math.log(1 - rand)
	end

	def get_produccion(id_archivo)
		archivo = Archivo.find(id_archivo)
		matriz = []

		archivo.productos.each do |producto|
			fila = []
			producto.produccion_diaria.each do |produccion|
				fila << produccion.cantidad
			end
			matriz << fila
		end
		# el indice de fila sería el producto elegido
		# el indice de columna sería la produccíón del 'n' día
		matriz
	end
end
