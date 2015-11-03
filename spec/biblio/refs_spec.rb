require 'spec_helper'


describe Biblio::Refs do

  before :each do
    @ref1 = Biblio::Refs::Referencia.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide")
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
end
