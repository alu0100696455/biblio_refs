require 'spec_helper'


describe BiblioRefs do

  before :each do

    @ref1 = BiblioRefs::Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide", "The Facets of Ruby", "Pragmatic Bookshelf", 4, Date.parse('7th July 2013'), ['978-1937785499', '1937785491'])
    @ref2 = BiblioRefs::Referencia.new("J.R.R Tolkien", "El Hobbit", "Minotauro", 2, Date.parse('1st February 1982'), '0345538374')
  end

  describe "Comprobación de la inicialización de los atributos de la clase" do

    it 'Tiene un número de versión' do
      expect(BiblioRefs::VERSION).not_to be nil
    end

    it 'Deben de existir uno o más autores' do
      expect(@ref1.autores).not_to be nil
    end

    it 'Debe de existir un título' do
      expect(@ref1.titulo).not_to be nil
    end

    it 'Debe o no existir una serie' do
      expect(@ref1.serie).not_to be nil
      expect(@ref2.serie).to be nil
    end

    it 'Debe existir una editorial' do
      expect(@ref1.editorial).not_to be nil
      expect(@ref2.editorial).not_to be nil
    end

    it 'Debe existir un número de edición' do
      expect(@ref1.num_edicion).not_to be nil
      expect(@ref2.num_edicion).not_to be nil
    end

    it 'Debe existir una fecha de publicación' do
      expect(@ref1.fecha_publicacion).not_to be nil
      expect(@ref2.fecha_publicacion).not_to be nil
    end

    it 'Debe existir uno o más números ISBN' do
      expect(@ref1.isbn).not_to be nil
      expect(@ref2.isbn).not_to be nil
    end
  end

  describe "Comprobación de métodos to_s" do
    it 'Debe existir un método que devuelva los autores' do
      expect(@ref1.autores_to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler.")
      expect(@ref2.autores_to_s).to eq("J.R.R Tolkien.")
    end

    it 'Debe existir un método que devuelva el título' do
      expect(@ref1.titulo_to_s).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide")
      expect(@ref2.titulo_to_s).to eq("El Hobbit")
    end

    it 'Debe existir un método que devuelva la serie' do
      expect(@ref1.serie_to_s).to eq("(The Facets of Ruby)")
      expect(@ref2.serie_to_s).to be nil
    end

    it 'Debe existir un método que devuelva la editorial' do
      expect(@ref1.editorial_to_s).to eq("Pragmatic Bookshelf")
      expect(@ref2.editorial_to_s).to eq("Minotauro")
    end

    it 'Debe existir un método que devuelva el número de edición' do
      expect(@ref1.num_edicion_to_s).to eq("4 edition")
      expect(@ref2.num_edicion_to_s).to eq("2 edition")
    end

    it 'Debe existir un método que devuelva la fecha de publicación' do
      expect(@ref1.fecha_publicacion_to_s).to eq("July 7, 2013")
      expect(@ref2.fecha_publicacion_to_s).to eq("February 1, 1982")
    end

    it 'Debe existir un método que devuelva el listado de números ISBN' do
      expect(@ref1.isbn_to_s).to eq("ISBN-13: 978-1937785499\nISBN-10: 1937785491")
      expect(@ref2.isbn_to_s).to eq("ISBN-10: 0345538374")
    end

    it 'Debe existir un método que devuelva la referencia formateada' do
      expect(@ref1.to_s).to eq ("Dave Thomas, Andy Hunt, Chad Fowler.\nProgramming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide\n(The Facets of Ruby)\nPragmatic Bookshelf; 4 edition (July 7, 2013)\nISBN-13: 978-1937785499\nISBN-10: 1937785491")
      expect(@ref2.to_s).to eq ("J.R.R Tolkien.\nEl Hobbit\nMinotauro; 2 edition (February 1, 1982)\nISBN-10: 0345538374")
    end
  end

  describe "Nodo" do
    before :each do
      @nodo1 = Nodo.new("último", nil, nil)
      @nodo2 = Nodo.new("primero", @nodo1, nil)
      @nodo1[:prev] = @nodo2
    end

   	it '#Debe existir un Nodo en la lista con sus datos y su siguiente' do
      expect(@nodo2[:value]).to eq("primero")
      expect(@nodo2[:next]).to eq(@nodo1)
    end

    it '#Debe existir un Nodo con su anterior' do
      expect(@nodo1[:prev]).to eq(@nodo2)
    end
  end

  describe "List" do
  	before :each do
  	  @lista1 = BiblioRefs::List.new("elemento")
  	  @lista2 = BiblioRefs::List.new("elemento1", "elemento2")
  	end

    it '#Debe existir una lista con su cabeza' do
      expect(@lista1.head[:value]).to eq("elemento")
      expect(@lista2.head[:value]).to eq("elemento1")
    end

    it '#Debe existir una lista con su cola' do
      expect(@lista1.tail[:value]).to eq("elemento")
      expect(@lista2.tail[:value]).to eq("elemento2")
    end

  	it '#Se extrae el primer elemento de la lista' do
  	  expect(@lista1.pop).to eq("elemento")
  	  expect(@lista2.pop).to eq("elemento1")
  	end

    it '#Se puede insertar un elemento' do
      @lista1.push("nuevo")
      expect(@lista1.head[:next][:value]).to eq("nuevo")
      expect(@lista1.tail[:prev][:value]).to eq("elemento")
    end

    it '#Se pueden insertar varios elementos' do
      @lista1.push("nuevo1", "nuevo2")
      expect(@lista1.head[:next][:value]).to eq("nuevo1")
      expect(@lista1.head[:next][:next][:value]).to eq("nuevo2")
      expect(@lista1.tail[:prev][:value]).to eq("nuevo1")
      expect(@lista1.tail[:prev][:prev][:value]).to eq("elemento")
    end

    it '#Debe existir un método que devuelve la lista formateada' do
      @lista1.push("elemento2", "elemento3")
      expect(@lista1.to_s).to eq("Lista: elemento -> elemento2 -> elemento3")
    end
  end

  describe "Lista de referencias" do
    before :each do
      @refa = BiblioRefs::Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide", "The Facets of Ruby", "Pragmatic Bookshelf", 4, Date.parse('7th July 2013'), ['978-1937785499', '1937785491'])
      @refb = BiblioRefs::Referencia.new("Scott Chacon", "Pro Git 2009th Edition", "Pro", "Apress", 2009, Date.parse('27th August 2009'), ['978-1430218333', '1430218339'])
      @refc = BiblioRefs::Referencia.new(["David Flanagan", "Yukihiro Matsumoto"], "The Ruby Programming Language", "O'Reilly Media", 1, Date.parse('4th February 2008'), ['0596516177', '978-0596516178'])
      @refd = BiblioRefs::Referencia.new(["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"], "The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends", "The Facets of Ruby", "Pragmatic Bookshelf", 1, Date.parse('25th December 2010'), ['1934356379', '978-1934356371'])
      @refe = BiblioRefs::Referencia.new("Richard E. Silverman", "Git Pocket Guide", "O'Reilly Media", 1, Date.parse('2nd August 2013'), ['1449325866', '978-1449325862'])
    
      @lista = BiblioRefs::List.new(@refa, @refb, @refc, @refd, @refe)
    end

    it '#Se puede crear una lista de Referencias Biográficas' do
      expect(@lista.to_s).to eq("Lista: #{@refa} -> #{@refb} -> #{@refc} -> #{@refd} -> #{@refe}")
    end
  end

  describe "Jerarquía de clases" do
    before :each do
      @publicacion = BiblioRefs::PublicacionPeriodica.new("Autor Abcd", Date.parse('22th July 2014'), "Titulo", "Editorial", 1, "999999999")
      @revista = BiblioRefs::Revista.new
      @libro = BiblioRefs::Libro.new("Autor Abcd Abcd", Date.parse('17th July 2003'), "Título del libro", "Subtítulo del libro", 1, 3, "Editor", ['999-9999999999', '9999999999'])
      @articulo = BiblioRefs::ArticuloPeriodico.new("Autor Abcd Abcd", Date.parse('17th February 2013'), "Titulo del artículo", "Periódico", 2, "9999999999")
      @documento = BiblioRefs::DocumentoElectronico.new("Autor Bcde", Date.parse('21th Juny 2000'), "Título", 1, "Tipo de medio", "Editor", "Vía de disponibilidad", Date.parse('23th November 2011'), "9999999999")    
    end

    it "#El objeto de la clase Libro es hijo de la clase Referencia" do
      expect(@libro).to be_a BiblioRefs::Referencia
    end

    it "#El objeto de la clase PublicacionPeriodica es hijo de la clase Referencia" do
      expect(@publicacion).to be_a BiblioRefs::Referencia
    end

    it "#El objeto de la clase Revista es hijo de la clase PublicacionPeriodica" do
      expect(@publicacion).to be_a BiblioRefs::PublicacionPeriodica
      expect(@publicacion).to be_a BiblioRefs::Referencia
    end

    it "#El objeto de la clase ArticuloPeriodico es hijo de la clase PublicacionPeriodica" do
      expect(@articulo).to be_a BiblioRefs::PublicacionPeriodica
      expect(@publicacion).to be_a BiblioRefs::Referencia
    end

    it "#El objeto de la clase DocumentoElectronico es hijo de la clase PublicacionPeriodica" do
      expect(@documento).to be_a BiblioRefs::PublicacionPeriodica
      expect(@publicacion).to be_a BiblioRefs::Referencia
    end
  end

  describe "Instancias de la clase Referencia comparables" do
    before :each do
      @refa = BiblioRefs::Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide", "The Facets of Ruby", "Pragmatic Bookshelf", 4, Date.parse('7th July 2013'), ['978-1937785499', '1937785491'])
      @refb = BiblioRefs::Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide", "The Facets of Ruby", "Pragmatic Bookshelf", 4, Date.parse('7th July 2013'), ['978-1937785499', '1937785491'])
      @refc = BiblioRefs::Referencia.new("Scott Chacon", "Pro Git 2009th Edition", "Pro", "Apress", 2009, Date.parse('27th August 2009'), ['978-1430218333', '1430218339'])
      @refd = BiblioRefs::Referencia.new(["David Flanagan", "Yukihiro Matsumoto"], "The Ruby Programming Language", "O'Reilly Media", 1, Date.parse('4th February 2008'), ['0596516177', '978-0596516178'])
    end

    it "#Se puede comparar dos objetos Referencias para saber si son iguales" do
      expect(@refa == @refb).to be true
    end

    context "#Se puede comparar dos objetos Referencias para saber cual es mayor o menor según la fecha de publicación" do
      it "#La fecha de publicación de la referencia A es más reciente que la de C" do
        expect(@refa > @refc).to be true
      end
      it "#La fecha de publicación de la referencia A es más reciente o igual que la de C" do
        expect(@refa >= @refc).to be true
      end
      it "#La fecha de publicación de la referencia D es más antigua que la de C" do
        expect(@refd < @refc).to be true
      end
      it "#La fecha de publicación de la referencia D es más antigua o igual que la de C" do
        expect(@refd <= @refc).to be true
      end
    end
  end

  describe "Haciendo la clase Lista enumerable" do
    before :each do
      @list1 = BiblioRefs::List.new(3, 2, 1)
      @list2 = BiblioRefs::List.new(4, 5, 6, 7)
      @list3 = BiblioRefs::List.new(0, 1, 0)
      @list4 = BiblioRefs::List.new(1, 0, 1, 0)
      @list5 = BiblioRefs::List.new(false, nil)
    end
    it "#Comprobrando el método all? con un bloque vacío" do
      expect(@list1.all?).to eq(true)
      expect(@list2.all?).to eq(true)
      expect(@list5.all?).to eq(false)
    end 
    it "#Comprobrando el método any?" do
      expect(@list3.any?).to eq(true)
      expect(@list4.any?).to eq(true)
      expect(@list5.any?).to eq(false)
    end 
    it "#Comprobrando el método collect" do
      expect(@list1.map{|i| i*i}).to eq([9, 4, 1])
      expect(@list2.map{|i| i*i}).to eq([16, 25, 36, 49])
      expect(@list3.collect{|i| i*i}).to eq([0, 1, 0])
      expect(@list4.collect{|i| i*i}).to eq([1, 0, 1, 0])
    end 
    it "#Comprobrando el método count" do
      expect(@list1.count).to eq(3)
      expect(@list2.count).to eq(4)
    end
    it "#Comprobrando el método detect" do
      expect(@list3.detect {|i| i == 0}).to eq(0)
      expect(@list4.detect {|i| i % 1 == 0}).to eq(1)
      expect(@list1.find {|i| i == 4}).to eq(nil)
      expect(@list2.find {|i| i % 6 == 1}).to eq(7)
    end
    it "#Comprobrando drop" do
      expect(@list3.drop(1)).to eq([1, 0])
      expect(@list4.drop(2)).to eq([1, 0])
    end
    it "#Comprobrando max" do
      expect(@list1.max).to eq(3)
      expect(@list2.max).to eq(7)
    end
    it "#Comprobrando min" do
      expect(@list3.min).to eq(0)
      expect(@list4.min).to eq(0)
    end
    it "#Comprobrando sort" do
      expect(@list1.sort).to eq([1, 2, 3])
      expect(@list2.sort).to eq([4, 5, 6, 7])
      expect(@list3.sort).to eq([0, 0, 1])
      expect(@list4.sort).to eq([0, 0, 1, 1])
    end
  end

  describe "Lista de citas y referencias bibliográficas en formato APA" do
    before :each do
      @refa = BiblioRefs::Libro.new("Autor Abcd Abcd", Date.parse('17th July 2003'), "Título del libro", "Subtítulo del libro", 1, 3, "Editor", ['999-9999999999', '9999999999'])
      @refb = BiblioRefs::Articulo.new(["Autor Abcd Abcd", "Autor Bcde Bcde"], Date.parse('4th August 2005'), "Título del artículo", ["Editor1", "Editor2"], "Titulo de la obra", 201, 1, 3, "Editor", "9999999999")
      @refc = BiblioRefs::ArticuloPeriodico.new("Autor Abcd Abcd", Date.parse('17th February 2013'), "Titulo del artículo", "Periódico", 2, "9999999999")
      @refd = BiblioRefs::DocumentoElectronico.new("Autor Bcde", Date.parse('21th Juny 2000'), "Título", 1, "Tipo de medio", "Editor", "Vía de disponibilidad", Date.parse('23th November 2011'), "9999999999")    
      @lista = BiblioRefs::List.new(@refa, @refb, @refc, @refd)
    end

    it '#Se puede crear una lista con objetos Libro, Articulo, ArtículoPeriodico y DocumentoElectronico' do
      expect(@lista.to_s).to eq("Lista: #{@refa} -> #{@refb} -> #{@refc} -> #{@refd}")
    end
  end
end