# == Schema Information
#
# Table name: assuntos
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  materia_id :integer
#  assunto_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assunto < ActiveRecord::Base
  attr_accessible :nome, :materia_id, :assunto_id
  belongs_to :materia
  belongs_to :assunto
  has_many :assuntos

  validates_presence_of :nome
  validates_presence_of :materia

  def name
  	self.nome
  end

end
