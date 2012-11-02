require 'spec_helper'

describe Materia do

	before { @materia = Materia.new(:nome => 'Portugues') }
	subject { @materia }

  it {should respond_to(:nome)}
  it {should respond_to(:imagem)}
  
  describe 'when name is present' do
  	#let(:materia) = Materia.new(:name => '')
  	it {should be_valid}
  end

  describe 'when name is not present' do
  	before {@materia.nome = ''}
  	it {should_not be_valid}
  end

end
