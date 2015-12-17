module BiblioRefs
  class PublicacionPeriodica < Referencia
    
    #Constructor de la clase PublicacionPeriodica
    def initialize(autores, fecha_publicacion, titulo, editorial, num_edicion, issn)
      super(autores, titulo, editorial, num_edicion, fecha_publicacion, issn)
    end

    #Método que devuelve una cadena de carácteres formateada del ISSN
    def isbn_to_s
      final = ""
      if isbn.kind_of?(Array)
        isbn.each do |num|
          final += "ISSN: " + num + "\n"
        end
        final.chop
      else
        final += "ISSN: " + isbn
      end
    end 
  end
end