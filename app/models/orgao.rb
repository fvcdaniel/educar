class Orgao < ActiveRecord::Base
  attr_accessible :nome

  validates_presence_of :nome
  validates_uniqueness_of :nome
  
end
