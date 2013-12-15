class Producto < ActiveRecord::Base
  belongs_to :archivo
  has_many :variables_de_produccion, class_name: "VariableDeProduccion"
  accepts_nested_attributes_for :variables_de_produccion
end
