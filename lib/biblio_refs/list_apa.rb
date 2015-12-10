module BiblioRefs
  class ListAPA

    attr_accessor :list

    def initialize(*nodo)
      @list = BiblioRefs::List.new(*nodo)
      sort_list
    end

    def sort_list
      array = @list.sort
      @list =  BiblioRefs::List.new(array[0])
      array.shift
      array.each do |ref|
        @list.push(ref)
      end
    end

    def to_s
      class << @list
        def to_s
          aux = @head
          string = "Lista APA: "
          while aux[:next] do
            string += "#{aux[:value]}" + "\n\n"
            aux = aux[:next]
          end
          string += "#{aux[:value]}"
        end
      end
      @list.to_s
    end

  end
end