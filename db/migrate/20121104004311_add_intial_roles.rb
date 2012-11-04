class AddIntialRoles < ActiveRecord::Migration
  def up
  	Role.create!(:name=>'admin')
  end

  def down
  	Role.find_by_name('admin').destroy
  end
end
