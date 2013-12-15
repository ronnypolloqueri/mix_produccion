class VariableDeProduccion < ActiveRecord::Base
  self.table_name = 'variables_de_produccion'
  belongs_to :producto
end
