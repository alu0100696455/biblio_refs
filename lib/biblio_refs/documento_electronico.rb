module BiblioRefs
	class DocumentoElectronico < PublicacionPeriodica
    
    attr_accessor :tipo_medio, :via_disponible, :fecha_acceso

		def initialize(autores, fecha_publicacion, titulo, num_edicion, tipo_medio, editorial, via_disponible, fecha_acceso, issn)
      super(autores, fecha_publicacion, titulo, editorial, num_edicion, issn)
      @tipo_medio = tipo_medio
      @via_disponible = via_disponible
      @fecha_acceso = @fecha_acceso
    end

    def to_s
      super
    end
    
  end
end