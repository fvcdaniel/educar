# == Schema Information
#
# Table name: questoes
#
#  id          :integer          not null, primary key
#  materia_id  :integer
#  concurso_id :integer
#  assunto_id  :integer
#  texto       :text
#  gabarito    :string(255)
#  tipo        :string(255)      default("M")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'spec_helper'

describe Questao do
  
  before { 
  	@questao = FactoryGirl.create(:questao2)
  }
  subject { @questao }

  it {should respond_to(:materia)}
  it {should respond_to(:concurso)}
  it {should respond_to(:assunto)}
  it {should respond_to(:texto)}
  it {should respond_to(:gabarito)}
  it {should respond_to(:tipo)}
  it {should respond_to(:user)}
  
  describe 'when name is present' do
  	it {should be_valid}
  end

  describe 'when name is not present' do
  	before {@questao.materia = nil}
  	it {should_not be_valid}
  end

end
