#encoding=utf-8

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
  has_many :assuntos, :dependent => :destroy
  has_many :questoes, :dependent => :destroy

  validates_presence_of :nome
  validates_presence_of :materia

  validate :assunto_id_cant_be_self_id

  def name
  	self.nome
  end

  def assunto_id_cant_be_self_id
    unless self.new_record?
      if self.id == self.assunto_id
        errors.add(:assunto_id, "não pode ser o mesmo assunto")
      end
    end
  end

end
