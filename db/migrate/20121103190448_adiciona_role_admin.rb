class AdicionaAdminUser < ActiveRecord::Migration
  def up
  	Role.create!(:nome => :admin)
  end

  def down
  	Role.destroy(:nome => :admin)
  end
end
