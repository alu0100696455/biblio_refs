module BiblioRefs
	class ArticuloPeriodico < PublicacionPeriodica
    
    attr_accessor :nombre_periodico, :num_paginas

		def initialize(autores, fecha_publicacion, titulo, nombre_periodico, num_paginas, issn)
      super(autores, fecha_publicacion, titulo, nil, nil, issn)
      @nombre_periodico = nombre_periodico
      @num_paginas = num_paginas
    end

    def to_s
      formato_apa + " " + nombre_periodico.capitalize + ", " + num_paginas.to_s + "."  
    end

  end
end