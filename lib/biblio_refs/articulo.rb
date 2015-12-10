module BiblioRefs
  class Articulo < Libro
    
  attr_accessor :titulo_articulo, :editores, :num_paginas

    def initialize(autores, fecha_publicacion, titulo_articulo, editores, titulo, num_paginas, num_edicion, volumen, editorial, isbn)
      super(autores, fecha_publicacion, titulo, num_edicion, volumen, editorial, isbn)
      @titulo_articulo = titulo_articulo
      @editores = editores
      @num_paginas = num_paginas
    end

    def to_s
      super
    end
    
  end
end