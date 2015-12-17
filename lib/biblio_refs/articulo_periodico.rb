module BiblioRefs
	class ArticuloPeriodico < PublicacionPeriodica
    
    attr_accessor :nombre_periodico, :num_paginas

    #Constructor de la clase ArticuloPeriodico
		def initialize(autores, fecha_publicacion, titulo, nombre_periodico, num_paginas, issn)
      super(autores, fecha_publicacion, titulo, nil, nil, issn)
      @nombre_periodico = nombre_periodico
      @num_paginas = num_paginas
    end

    #Método que asigna los valores partículares del objeto ArticuloPeriodico creado mediante DSL
    def newspaper(periodico = {})
      @nombre_periodico = periodico[:name]
      @num_paginas = periodico[:pages]
    end

    #Método que devuelve una cadena de carácteres formateada de los objetos de la clase ArticuloPeriodico
    def to_s
      formato_apa + " " + nombre_periodico.capitalize + ", " + num_paginas.to_s + "."  
    end

  end
end