# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  texto      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ancestry   :string(255)
#  questao_id :integer
#  user_id    :integer
#

class Comment < ActiveRecord::Base
  attr_accessible :texto, :questao_id, :user_id
  belongs_to :questao
  belongs_to :user
  has_ancestry

  validates_presence_of :user
  
end
