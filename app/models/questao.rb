#encoding=utf-8
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
  belongs_to :user
  has_many :itens, :dependent => :destroy
  has_many :respostas, :dependent => :destroy
  
  attr_accessible :texto, :materia_id, :concurso_id, :assunto_id, :gabarito, :tipo, :user_id, :itema, :itemb, :itemc, :itemd, :iteme

  validates_presence_of :texto, :materia, :concurso, :assunto, :user, :gabarito, :tipo

  validate :gabarito_between_a_e
  validate :assunto_belongs_to_materia_id

  def name
  	self.id.to_s + ' - ' + self.assunto.name
  end

  def gabarito_between_a_e

    unless ['A', 'B', 'C', 'D', 'E'].include?(self.gabarito) 
      errors.add(:gabarito, "não é válido")
    end
  end

  def assunto_belongs_to_materia_id
    if self.assunto_id
      unless Assunto.find(self.assunto_id).materia_id == self.materia_id 
        errors.add(:assunto, "Assunto tem que pertencer à matéria cadastrada!")
      end
    end
  end

  def itema
    self.itens[0].desc if self.itens[0]
  end
  def itemb
    self.itens[1].desc if self.itens[1]
  end
  def itemc
    self.itens[2].desc if self.itens[2]
  end
  def itemd
    self.itens[3].desc if self.itens[3]
  end
  def iteme
    self.itens[4].desc if self.itens[4]
  end


end
