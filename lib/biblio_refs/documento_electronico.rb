module BiblioRefs
	class DocumentoElectronico < PublicacionPeriodica
    
    attr_accessor :tipo_medio, :via_disponible, :fecha_acceso

    #Constructor de la clase DocumentoElectronico
		def initialize(autores, fecha_publicacion, titulo, num_edicion, tipo_medio, editorial, via_disponible, fecha_acceso, issn)
      super(autores, fecha_publicacion, titulo, editorial, num_edicion, issn)
      @tipo_medio = tipo_medio
      @via_disponible = via_disponible
      @fecha_acceso = fecha_acceso
    end

    #Método que asigna los valores partículares del objeto DocumentoEletronico creado mediante DSL
    def document(documento = {})
      @tipo_medio = documento[:media]
      @via_disponible = documento[:platform]
      @fecha_acceso = Date.parse(documento[:access_date])
    end

    #Método que devuelve una cadena de carácteres formateada de la fecha de acceso
    def fecha_acceso_to_s
      Date::MONTHNAMES[fecha_acceso.mon] + " " + fecha_acceso.day.to_s + ", " + fecha_acceso.year.to_s
    end

    #Método que devuelve una cadena de carácteres formateada de los objetos de la clase DocumentoElectronico
    def to_s
      formato_apa + " (" + num_edicion.to_s + "). [" + tipo_medio.capitalize + "]. Lugar de publicación: " + editorial.to_s.capitalize + ". Disponible en: " + via_disponible.to_s.capitalize + " [" + fecha_acceso_to_s + "]."  
    end

  end
end