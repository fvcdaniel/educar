class Comment < ActiveRecord::Base
  attr_accessible :texto, :questao_id
  belongs_to :questao
  has_ancestry
  
end
