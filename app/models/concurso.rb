class Concurso < ActiveRecord::Base
  attr_accessible :ano, :cargo, :edital, :gabarito, :nome

  validates_presence_of :nome, :ano, :cargo

  def name
  	self.nome
  end
  
end
