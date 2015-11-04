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

    	def fecha_publicacion_to_s
    		Date::MONTHNAMES[fecha_publicacion.mon] + " " + fecha_publicacion.day.to_s + ", " + fecha_publicacion.year.to_s
		end

		def isbn_to_s
			final = ""
			if isbn.kind_of?(Array)
				isbn.each do |num|
					if num.length > 12
						final += "ISBN-13: " + num + "\n"
					else
						final += "ISBN-10: " + num + "\n"
					end
				end
				final.chop
			else
				if isbn.length > 12
					final += "ISBN-13: " + isbn
				else
					final += "ISBN-10: " + isbn
				end
			end
		end
    end
  end
end
