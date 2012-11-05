class Questao < ActiveRecord::Base
  belongs_to :materia
  belongs_to :concurso
  belongs_to :assunto
  attr_accessible :texto, :materia_id, :concurso_id, :assunto_id

  validates_presence_of :texto, :materia, :concurso, :assunto

end
