class AdicionaRoleAdmin < ActiveRecord::Migration
  def up
  	Role.create(:name => :admin) 
  end

  def down
  	Role.destroy(:name => :admin) 
  end
end
