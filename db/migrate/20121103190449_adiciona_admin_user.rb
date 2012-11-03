class AdicionaAdminUser < ActiveRecord::Migration
  def up
  	user = User.find_by_email('fvcdaniel@gmail.com')
  	unless user.blank?
  		unless user.roles.include? Role.find_by_name(:admin)
  			user.roles << Role.find_by_name(:admin)
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
