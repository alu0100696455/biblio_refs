require "biblio/refs/version"

module Biblio
  module Refs
    class Referencia
    	attr_accessor :autores, :titulo, :serie, :editorial, :num_edicion

    	def initialize(autores, titulo, serie = nil, editorial, num_edicion)
    		@autores = autores
    		@titulo = titulo
    		@serie = serie
    		@editorial = editorial
    		@num_edicion = num_edicion
    	end
    end
  end
end
