module BiblioRefs
	class Libro < Referencia
    
    attr_accessor :subtitulo, :volumen

		def initialize(autores, fecha_publicacion, titulo, subtitulo = nil, num_edicion, volumen, editorial, isbn)
      super(autores, titulo, editorial, num_edicion, fecha_publicacion, isbn)
      @subtitulo = subtitulo
      @volumen = volumen
    end

    def to_s
      super
    end
    
  end
end