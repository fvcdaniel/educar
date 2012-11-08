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

class Materia < ActiveRecord::Base
  attr_accessible :imagem, :nome
  
  validates_presence_of :nome
  validates_uniqueness_of :nome

  def name
  	self.nome
  end
  
end
