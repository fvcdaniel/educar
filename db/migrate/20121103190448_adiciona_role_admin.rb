class AdicionaRoleAdmin < ActiveRecord::Migration
  def up
  	Role.create!(:nome => :admin) if Role.find_by_nome(:admin).blank?
  end

  def down
  	Role.destroy(:nome => :admin) unless Role.find_by_nome(:admin).blank?
  end
end
