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
  end
end