class Archivo < ActiveRecord::Base
	has_many :productos
	accepts_nested_attributes_for :productos
end
