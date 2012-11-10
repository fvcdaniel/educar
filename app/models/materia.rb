#encoding=utf-8

# == Schema Information
#
# Table name: materias
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  imagem     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Materia < ActiveRecord::Base
  attr_accessible :imagem, :nome
  
  validates_presence_of :nome
  validates_uniqueness_of :nome

  has_many :assuntos, :dependent => :destroy
  has_many :questoes, :dependent => :destroy

  def name
  	self.nome
  end

  MINUSCULAS_COM_ACENTO = 'áéíóúâêîôûàèìòùäëïöüãõñç'

  def titleize(texto)
  	texto = 'TRAÇÃO'
  	puts texto.downcase
    return texto if texto.nil? or texto.empty?
    texto = texto.downcase
    texto = texto.downcase
    texto.mb_chars[0] = texto.mb_chars.first.upcase
    texto = texto.gsub(/\s[a-z#{Materia::MINUSCULAS_COM_ACENTO}]/) {|a| a.upcase }
    texto
  end
  
end
