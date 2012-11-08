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
#

class Questao < ActiveRecord::Base
  belongs_to :materia
  belongs_to :concurso
  belongs_to :assunto
  has_many :itens
  
  attr_accessible :texto, :materia_id, :concurso_id, :assunto_id, :gabarito, :tipo

  validates_presence_of :texto, :materia, :concurso, :assunto

  def name
  	self.id.to_s + ' - ' + self.assunto.name
  end

end
