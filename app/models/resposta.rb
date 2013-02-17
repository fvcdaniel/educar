# == Schema Information
#
# Table name: resposta
#
#  id         :integer          not null, primary key
#  questao_id :integer
#  user_id    :integer
#  gabarito   :string(255)
#  resposta   :string(255)
#  tempo      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resposta < ActiveRecord::Base
  belongs_to :questao
  belongs_to :user
  attr_accessible :gabarito, :resposta, :tempo, :questao_id, :user_id
  
end
