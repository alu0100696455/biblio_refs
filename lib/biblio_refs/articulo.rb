module BiblioRefs
  class Articulo < Libro
    
  attr_accessor :titulo_obra, :editores, :num_paginas

    def initialize(autores, anyo_publicacion, titulo, editores, titulo_obra, num_paginas, num_edicion, volumen, editorial, isbn)
      super(autores, anyo_publicacion, titulo, nil, num_edicion, volumen, editorial, isbn)
      @titulo_obra = titulo_obra
      @editores = editores
      @num_paginas = num_paginas
      @counter = 0
    end

    def article(articulo = {})
      @titulo_obra = articulo[:book]
      @editores = articulo[:editor]
      @num_paginas = articulo[:pages]
      @volumen = articulo[:volume]  
      @fecha_publicacion = Date.parse('1st January #{articulo[:year]}')
    end

    def editores_to_s
      final = ""
      if editores.kind_of?(Array)
        editores.each do |editor|
          final += editor
          final += " & "
        end
        final[-3...-1] = ""
      else
        final += editores
        final += " "
      end
      final.chop
    end

    def to_s
      formato_apa + " En " + editores_to_s + ", " + titulo_obra.to_s.capitalize + " (" + num_paginas.to_s + ")(" + num_edicion_to_s + ")(" + volumen.to_s + "). Lugar de publicación: " + editorial_to_s.capitalize 
    end

  end
end