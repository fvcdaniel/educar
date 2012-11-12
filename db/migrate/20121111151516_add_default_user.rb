class AddDefaultUser < ActiveRecord::Migration
  def up
  	User.create(:email => 'default@localhost.com', :password => '123456', :password_confirmation => '123456')
  end

  def down
  	User.find_by_email('default@localhost.com').destroy
  end
end
