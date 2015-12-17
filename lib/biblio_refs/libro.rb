module BiblioRefs
	class Libro < Referencia
    
    attr_accessor :subtitulo, :volumen

    #Constructor de la clase Libro
		def initialize(autores, anyo_publicacion, titulo, subtitulo, num_edicion, volumen, editorial, isbn)
      super(autores, titulo, editorial, num_edicion, Date.parse('1st January #{anyo_publicacion}'), isbn)
      @subtitulo = subtitulo
      @volumen = volumen
    end

    #Método que asigna los valores partículares del objeto Libro creado mediante DSL
    def book(libro = {})
      @subtitulo = libro[:name]
      @volumen = libro[:volume]
      @fecha_publicacion = Date.parse('1st January #{libro[:year]}')
    end

    #Método que devuelve una cadena de carácteres formateada de la fecha de publicación
    def fecha_publicacion_to_s
      fecha_publicacion.year.to_s
    end

    #Método que devuelve una cadena de carácteres formateada de los objetos de la clase Libro
    def to_s
      formato_apa.chop + ": " + subtitulo.to_s.capitalize + " (" + num_edicion_to_s + ")(" + volumen.to_s + "). Lugar de publicación: " + editorial_to_s.capitalize + "." 
    end

  end
end