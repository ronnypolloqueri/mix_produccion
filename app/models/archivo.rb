class Archivo < ActiveRecord::Base
	has_many :productos
	accepts_nested_attributes_for :productos, :reject_if => :all_blank, :allow_destroy => true

	# validates :nombre, :num_de_dias, presence: { message: ' no puede dejarse en blanco'}
	# Recibe los productos
	# No confundirse al ingresar los valores de las variables
	def resolver
		matriz = []
		m_cantidades_producidas = matriz_de_cantidades_producidas
		m_variables_de_produccion = matriz_de_variables_de_produccion

		num_dias = num_de_dias # El valor de campo ingresado al inicio
		num_variables = m_variables_de_produccion[0].size
		num_productos = m_cantidades_producidas.size

		s = []
		suma =[]

		num_dias.times{ s << 0 }
		num_variables.times{ suma << s.clone }

		# i iterara sobre las columnas(dias)
		# j sobre las filas(productos) por lo general j < i
		# multiplicaciones = []
		num_dias.times do |d|
			num_variables.times do |v|
				num_productos.times do |p|
					# multiplicaciones << {m: m_cantidades_producidas[p][d], n: m_variables_de_produccion[p][v], mul: (m_cantidades_producidas[p][d] * m_variables_de_produccion[p][v])}
					suma[v][d] += (m_cantidades_producidas[p][d] * m_variables_de_produccion[p][v])
				end
			end
		end

		index_variable = 0
		productos[0].variables_de_produccion.each do |variable|
			matriz << {nombre: variable.nombre, cantidad: suma[index_variable]}
			index_variable += 1
		end

		matriz
		# multiplicaciones
	end

	# las columnas representaran las producciones diarias
	# La filas 0 es del primer producto y la n del ultimo
	private
		def matriz_de_cantidades_producidas
			matriz = []
			productos.each do |producto|
		      produccion_diaria = producto.produccion_diaria
		      cantidades = []
		      produccion_diaria.each do |produccion|
		        cantidades << produccion.cantidad
		      end
			  matriz << cantidades
			end
			matriz
		end

		# las columnas representaran las variables de produccion
		# La filas 0 es del primer producto y la n del ultimo

		def matriz_de_variables_de_produccion
			matriz = []
			productos.each do |producto|
		      variables = producto.variables_de_produccion
		      valores = []
		      variables.each do |variable|
		        valores << variable.valor
		      end
			  matriz << valores
			end
			matriz
		end

		def imprime_matriz(matriz)
			matriz.size.times do |i|
				matriz[0].size.times do |j|
					puts matriz[i][j]
				end
			end
		end
end
