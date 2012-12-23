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
  attr_accessible :ano, :cargo, :edital, :prova, :gabarito, :nome, :banca_id, :banca

  validates_presence_of :nome, :ano, :cargo

  has_many :questoes, :dependent => :destroy
  belongs_to :banca

  mount_uploader :edital, PdfUploader
  mount_uploader :prova, PdfUploader
  mount_uploader :gabarito, PdfUploader

  def name
  	"#{self.nome} - #{self.ano} - #{self.cargo}".upcase
  end

  def nome=(val)
    self[:nome] = val.upcase
  end
  
  def cargo=(val)
    self[:cargo] = val.upcase
  end

end
