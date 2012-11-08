# == Schema Information
#
# Table name: materias
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  imagem     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
