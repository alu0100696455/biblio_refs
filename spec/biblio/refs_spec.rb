require 'spec_helper'

describe Biblio::Refs do

  before :each do
  end

  it 'Tiene un número de versión' do
    expect(Biblio::Refs::VERSION).not_to be nil
  end

  it 'Debe de existir uno o más autores' do
    expect(@ref1.autores).not_to be nil
  end
end
