# == Schema Information
#
# Table name: itens
#
#  id         :integer          not null, primary key
#  desc       :text
#  questao_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Item < ActiveRecord::Base
  belongs_to :questao
  
  attr_accessible :desc, :questao_id

  validates_presence_of :desc, :questao

  def name
  	self.desc
  end

end
