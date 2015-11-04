require "biblio/refs/version"
require 'date'

module Biblio
  module Refs
    class Referencia
    	attr_accessor :autores, :titulo, :serie, :editorial, :num_edicion, :fecha_publicacion, :isbn

    	def initialize(autores, titulo, serie = nil, editorial, num_edicion, fecha_publicacion, isbn)
    		@autores = autores
    		@titulo = titulo
    		@serie = serie
    		@editorial = editorial
    		@num_edicion = num_edicion
    		@fecha_publicacion = fecha_publicacion
    		@isbn = isbn
    	end

    	def autores_to_s
    		final = ""
    		if autores.kind_of?(Array)
	    		autores.each do |autor|
	    			final += autor
	    			final += ", "
	    		end
	    		final[-2] = "."
	    	else
	    		final += autores
	    		final += ". "
    		end
    		final.chop
    	end

    	def titulo_to_s
    		titulo.to_s
    	end

    	def serie_to_s
    		if serie != nil
    			"(" + serie.to_s + ")"
    		end
    	end

    	def editorial_to_s
    		editorial.to_s
    	end

    	def num_edicion_to_s
    		num_edicion.to_s + " edition"
    	end
    end
  end
end
