# == Schema Information
#
# Table name: bancas
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Banca < ActiveRecord::Base
  attr_accessible :nome
  has_many :concursos, :dependent => :destroy #muito cuidado com isto
  validates_presence_of :nome
  validates_uniqueness_of :nome

  def name
  	self.nome
  end

  def to_s
  	self.nome
  end
end
