class Assunto < ActiveRecord::Base
  attr_accessible :nome, :materia_id, :assunto_id
  belongs_to :materia
  belongs_to :assunto

  validates_presence_of :nome
  validates_presence_of :materia

  def name
  	self.nome
  end

end
