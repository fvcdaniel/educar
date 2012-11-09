# == Schema Information
#
# Table name: concursos
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  ano        :integer
#  cargo      :string(255)
#  edital     :string(255)
#  gabarito   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Concurso < ActiveRecord::Base
  attr_accessible :ano, :cargo, :edital, :gabarito, :nome

  validates_presence_of :nome, :ano, :cargo

  has_many :questoes, :dependent => :destroy

  def name
  	self.nome
  end
  
end
