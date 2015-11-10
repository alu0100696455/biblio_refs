# create a Struct with :value and :next
Nodo = Struct.new(:value, :next)

module BiblioRefs
	class List
    attr_accessor :head

		def initialize(nodo)
      @head = Nodo.new(nodo, nil)
    end

    def pop
      nodo = @head
      @head = @head[:next]
      nodo[:value]
    end

    def push(nodo)
      aux = @head
      while aux[:next] do
        aux = aux[:next]
      end
      aux[:next] = Nodo.new(nodo, nil) 
    end
  end
end