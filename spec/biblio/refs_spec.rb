require 'spec_helper'


describe Biblio::Refs do

  before :each do
    @ref1 = Biblio::Refs::Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide", "The Facets of Ruby", "Pragmatic Bookshelf")
    @ref2 = Biblio::Refs::Referencia.new("J.R.R Tolkien", "El Hobbit", "Minotauro")
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
end
