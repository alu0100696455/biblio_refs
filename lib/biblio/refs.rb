require "biblio/refs/version"

module Biblio
  module Refs
    class Referencia
    	attr_accessor :autores, :titulo, :serie

    	def initialize(autores, titulo, serie = nil)
    		@autores = autores
    		@titulo = titulo
    		@serie = serie
    	end
    end
  end
end
