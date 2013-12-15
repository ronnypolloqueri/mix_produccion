class ProduccionDiaria < ActiveRecord::Base
  self.table_name= 'produccion_diaria'
  belongs_to :producto
end
