require 'spec_helper'


describe Biblio::Refs do

  before :each do

    @ref1 = Biblio::Refs::Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide", "The Facets of Ruby", "Pragmatic Bookshelf", 4, Date.parse('7th July 2013'), ['978-1937785499', '1937785491'])
    @ref2 = Biblio::Refs::Referencia.new("J.R.R Tolkien", "El Hobbit", "Minotauro", 2, Date.parse('1st February 1982'), '0345538374')
  end

  it 'Tiene un número de versión' do
    expect(Biblio::Refs::VERSION).not_to be nil
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
