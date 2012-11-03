class AdicionaRoleAdmin < ActiveRecord::Migration
  def up
  	Role.create!(:name => :admin) if Role.find_by_name(:admin).nil?
  end

  def down
  	Role.destroy(:name => :admin) unless Role.find_by_name(:admin).nil?
  end
end
