# create a Struct with :value and :next
Nodo = Struct.new(:value, :next, :prev)

module BiblioRefs
	class List
    include Enumerable

    attr_accessor :head, :tail

    #Constructor de la clase List
		def initialize(*nodo)
      @tail = @head = Nodo.new(nodo[0])
      if nodo.size > 1
        nodo.shift
        push(*nodo)
      end
    end

    #Método que recorre todos los valores de los nodos de la lista
    #Necesario para hacer la clase List enumerable, haciendo 'yield' a todos los valores
    def each
      aux = @head
      while aux[:next]
        yield aux[:value]
        aux = aux[:next]
      end
      yield aux[:value]
    end

    #Método que devuelve y extrae el valor del primer nodo de la lista
    def pop
      nodo = @head
      @head = @head[:next]
      nodo[:value]
    end

    #Método que inserta uno o varios nodos al final de la lista
    def push(*nodo)
      aux = @head
      nodo.each do |n|
        while aux[:next] do
          aux = aux[:next]
        end
        @tail = aux[:next] = Nodo.new(n, nil, aux)
      end
    end

    #Método que devuelve una cadena de carácteres formateada de los objetos de la clase List
    def to_s
      aux = @head
      string = "Lista: "
      while aux[:next] do
        string += "#{aux[:value]}" + " -> "
        aux = aux[:next]
      end
      string += "#{aux[:value]}"
    end
  end
end