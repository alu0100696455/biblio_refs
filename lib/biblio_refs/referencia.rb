require 'date'

module BiblioRefs
  class Referencia
    include Comparable

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

    def <=> (ref)
      return nil unless ref.is_a? Referencia
      if(@autores.kind_of?(Array) && ref.autores.kind_of?(Array))
        comparar_autores(@autores[0], ref.autores[0], ref)
      elsif(@autores.kind_of?(Array))
        comparar_autores(@autores[0], ref.autores, ref)
      elsif(ref.autores.kind_of?(Array))
        comparar_autores(@autores, ref.autores[0], ref)
      else
        comparar_autores(@autores, ref.autores, ref)
      end
    end

    def == (ref)
      return nil unless ref.instance_of? Referencia
      self.to_s == ref.to_s
    end

    def comparar_autores(autor1, autor2, ref)
      if((autor1 <=> autor2) == 0)
          if((@fecha_publicacion <=> ref.fecha_publicacion) == 0)
            @titulo <=> ref.titulo
          else
            @fecha_publicacion <=> ref.fecha_publicacion
          end
        else
          autor1 <=> autor2
        end
    end

    def autores_to_s
      final = ""
      if autores.kind_of?(Array)
        autores.each do |autor|
          final += autor
          final += " & "
        end
        final[-3...-1] = ""
      else
        final += autores
        final += " "
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

    def formato_apa
      autores_to_s + " (" + fecha_publicacion_to_s + ")" + ". " + titulo_to_s.capitalize + "."
    end

    def to_s
      final = autores_to_s + ".\n" + titulo_to_s + "\n"
      if serie != nil
        final += serie_to_s + "\n"
      end
      final += editorial_to_s + "; " + num_edicion_to_s + " (" + fecha_publicacion_to_s + ")\n" + isbn_to_s
    end
  end
end
