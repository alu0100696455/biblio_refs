require "biblio/refs/version"

module Biblio
  module Refs
    class Referencia
    	attr_accessor :autores

    	def initialize(autores)
    		@autores = autores
    	end
    end
  end
end
