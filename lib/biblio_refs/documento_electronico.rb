module BiblioRefs
	class DocumentoElectronico < PublicacionPeriodica
    
    attr_accessor :tipo_medio, :via_disponible, :fecha_acceso

		def initialize(autores, fecha_publicacion, titulo, num_edicion, tipo_medio, editorial, via_disponible, fecha_acceso, issn)
      super(autores, fecha_publicacion, titulo, editorial, num_edicion, issn)
      @tipo_medio = tipo_medio
      @via_disponible = via_disponible
      @fecha_acceso = fecha_acceso
    end

    def document(documento = {})
      @tipo_medio = documento[:media]
      @via_disponible = documento[:platform]
      @fecha_acceso = Date.parse(documento[:access_date])
    end

    def fecha_acceso_to_s
      Date::MONTHNAMES[fecha_acceso.mon] + " " + fecha_acceso.day.to_s + ", " + fecha_acceso.year.to_s
    end

    def to_s
      formato_apa + " (" + num_edicion.to_s + "). [" + tipo_medio.capitalize + "]. Lugar de publicación: " + editorial.to_s.capitalize + ". Disponible en: " + via_disponible.to_s.capitalize + " [" + fecha_acceso_to_s + "]."  
    end

  end
end