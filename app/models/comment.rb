class Comment < ActiveRecord::Base
  attr_accessible :texto, :questao_id, :user_id
  belongs_to :questao
  belongs_to :user
  has_ancestry

  validates_presence_of :user
  
end
