class Resposta < ActiveRecord::Base
  belongs_to :questao
  belongs_to :user
  attr_accessible :gabarito, :resposta, :tempo, :questao_id, :user_id
  
end
