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
  has_many :comments, :dependent => :destroy
  
  attr_accessible :texto, :materia_id, :concurso_id, :assunto_id, :gabarito, :tipo, :user_id
  attr_accessor :questao_itens

  validates_presence_of :texto, :materia, :concurso, :assunto, :user, :gabarito, :tipo

  validate :assunto_belongs_to_materia_id
  validate :gabarito_for_tipos

  def name
  	self.id.to_s + ' - ' + self.assunto.name
  end

  def gabarito_for_tipos

    self.gabarito = self.gabarito.upcase

    if self.tipo == 'M'
      if self.questao_itens.blank? or self.questao_itens.size == 5
        unless ['A', 'B', 'C', 'D', 'E'].include?(self.gabarito) 
          errors.add(:gabarito, "não é válido")
        end
      else
        itens = ('A'..'Z').collect{|a| a}.first(self.questao_itens.size)
        unless itens.include?(self.gabarito) 
          errors.add(:gabarito, "não é válido")
        end
      end
      
    elsif self.tipo == 'C'

      arrtipos = ('A'..'Z').select{|a| !'CE'.include? a }
      self.gabarito.chars.each do |g|
        if arrtipos.include? g
          errors.add(:gabarito, "não é válido")
        end
      end

      if self.questao_itens.size != self.gabarito.size
        errors.add(:gabarito, "não é válido")
      end

    else
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

end
