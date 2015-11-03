require "biblio/refs/version"

module Biblio
  module Refs
    class Referencia
    	attr_accessor :autores, :titulo, :serie, :editorial

    	def initialize(autores, titulo, serie = nil, editorial)
    		@autores = autores
    		@titulo = titulo
    		@serie = serie
    		@editorial = editorial
    	end
    end
  end
end
