require "biblio/refs/version"

module Biblio
  module Refs
    class Referencia
    	attr_accessor :autores, :titulo

    	def initialize(autores, titulo)
    		@autores = autores
    		@titulo = titulo
    	end
    end
  end
end
