class AdicionaRoleAdmin < ActiveRecord::Migration
  def up
  	Role.create!(:nome => :admin) if Role.find_by_name(:admin).blank?
  end

  def down
  	Role.destroy(:nome => :admin) unless Role.find_by_name(:admin).blank?
  end
end
