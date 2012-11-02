class Materia < ActiveRecord::Base
  attr_accessible :imagem, :nome
  
  validates_presence_of :nome
  validates_uniqueness_of :nome

  def name
  	self.nome
  end
  
end
