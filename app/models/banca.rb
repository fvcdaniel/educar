class Banca < ActiveRecord::Base
  attr_accessible :nome
  has_many :concursos, :dependent => :destroy #muito cuidado com isto

  def name
  	self.nome
  end

  def to_s
  	self.nome
  end
end
