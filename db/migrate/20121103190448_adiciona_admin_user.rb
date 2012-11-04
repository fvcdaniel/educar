class AdicionaAdminUser < ActiveRecord::Migration
  def up
  	user = User.find_by_email('fvcdaniel@gmail.com')
  	if user.blank?
  		user = User.create!(:email => 'fvcdaniel@gmail.com', :password => 'fvc0902', :password_confirmation => 'fvc0902')
  	end
  	role = Role.find_by_name(:admin)
  	unless user.blank? and role.blank?
  		unless user.roles.include? role
  			user.roles << role
  			user.save
  		end
  	end
  end

  def down
  	user = User.find_by_email('fvcdaniel@gmail.com')
  	user.roles.delete Role.find_by_name(:admin)
  	user.save
  end
end
