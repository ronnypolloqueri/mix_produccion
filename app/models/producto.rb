class Producto < ActiveRecord::Base
  belongs_to :archivo
  has_many :variables_de_produccion, class_name: "VariableDeProduccion"
  has_many :produccion_diaria , class_name: "ProduccionDiaria"
  accepts_nested_attributes_for :variables_de_produccion
  accepts_nested_attributes_for :produccion_diaria
end
