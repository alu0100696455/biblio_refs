require 'date'

module BiblioRefs
  class Referencia
    include Comparable

    attr_accessor :autores, :titulo, :serie, :editorial, :num_edicion, :fecha_publicacion, :isbn

    #Constructor de la clase Referencia
    def initialize(autores, titulo, serie = nil, editorial, num_edicion, fecha_publicacion, isbn)
      @autores = autores
      @titulo = titulo
      @serie = serie
      @editorial = editorial
      @num_edicion = num_edicion
      @fecha_publicacion = fecha_publicacion
      @isbn = isbn
    end

    #Método para crear objetos de la clase Referencia o de sus hijas mediante DSL
    #Recibe un bloque como parámetro
    def self.nuevo(&block)
      if self == BiblioRefs::Libro
        ref = self.new(nil, nil, nil, nil, nil, nil, nil, nil)
      elsif self == BiblioRefs::Articulo
        ref = self.new(nil, nil, nil, nil, nil, nil, nil, nil, nil, nil)
      elsif self == BiblioRefs::ArticuloPeriodico
        ref = self.new(nil, nil, nil, nil, nil, nil)
      elsif self == BiblioRefs::DocumentoElectronico
        ref = self.new(nil, nil, nil, nil, nil, nil, nil, nil, nil)
      else
        puts "Error"
      end
      ref.instance_eval &block
      ref
    end

    #Método para hacer la clase Referencia comparable
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

    #Método que sobreescribe las reglas para identificar si dos referencias son iguales
    def == (ref)
      return nil unless ref.instance_of? Referencia
      self.to_s == ref.to_s
    end

    #Método para comparar dos autores de distinta referencia, si son iguales compara
    #los títulos de la obra y, si estos coinciden, la fecha de publicación.
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

    #Método que define los valores de 'author' asignados mediante DSL del objeto Referencia
    def author(autor = {})
     if @autores == nil
        @autores = "#{autor[:surname]}, #{autor[:name]}"
      elsif @autores.kind_of?(Array)
        @autores << "#{autor[:surname]}, #{autor[:name]}"
      else
        arr_autores = [@autores]
        arr_autores << "#{autor[:surname]}, #{autor[:name]}"
        @autores = arr_autores
      end
    end

    #Método que define los valores de 'title' asignados mediante DSL del objeto Referencia
    def title(titulo = {})
      @titulo = titulo
    end

    #Método que define los valores de 'author' asignados mediante DSL del objeto Referencia
    def info(informacion = {})
      @serie = informacion[:serie]
      @editorial = informacion[:editorial]
      @num_edicion = informacion[:edition]
      if informacion[:date]
        @fecha_publicacion = Date.parse(informacion[:date])
      end
      @isbn = informacion[:isbn]
    end

    #Método que devuelve una cadena de carácteres formateada de los autores
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

    #Método que devuelve una cadena de carácteres formateada del título
    def titulo_to_s
      titulo.to_s
    end

    #Método que devuelve una cadena de carácteres formateada de la serie
    def serie_to_s
      if serie != nil
        "(" + serie.to_s + ")"
      end
    end

    #Método que devuelve una cadena de carácteres formateada de la editorial
    def editorial_to_s
      editorial.to_s
    end

    #Método que devuelve una cadena de carácteres formateada del número de edición
    def num_edicion_to_s
      num_edicion.to_s + " edition"
    end

    #Método que devuelve una cadena de carácteres formateada de la fecha de publicación
    def fecha_publicacion_to_s
      Date::MONTHNAMES[fecha_publicacion.mon] + " " + fecha_publicacion.day.to_s + ", " + fecha_publicacion.year.to_s
    end

    #Método que devuelve una cadena de carácteres formateada del ISBN
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

    #Método que devuelve una cadena de carácteres con formato APA del objeto Referencia
    def formato_apa
      autores_to_s + " (" + fecha_publicacion_to_s + ")" + ". " + titulo_to_s.capitalize + "."
    end

    #Método que devuelve una cadena de carácteres formateada de los objetos de la clase Referencia
    def to_s
      final = autores_to_s + ".\n" + titulo_to_s + "\n"
      if serie != nil
        final += serie_to_s + "\n"
      end
      final += editorial_to_s + "; " + num_edicion_to_s + " (" + fecha_publicacion_to_s + ")\n" + isbn_to_s
    end
  end
end
